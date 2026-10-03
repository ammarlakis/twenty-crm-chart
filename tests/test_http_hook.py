"""Regression checks for the rendered Helm HTTP smoke hook."""
import os
from pathlib import Path
import shlex
import subprocess
import unittest

ROOT = Path(__file__).resolve().parents[1]


class HttpHookTest(unittest.TestCase):
    def render(self, *args):
        return subprocess.check_output(
            [*shlex.split(os.environ.get("HELM", "helm")), "template", "smoke",
             "charts/twenty", "-f", "charts/twenty/ci/smoke-values.yaml",
             "--show-only", "templates/test-http.yaml", *args],
            cwd=ROOT, text=True,
        )

    def test_html_request_explicitly_accepts_html(self):
        hook = self.render()
        request = next(line.strip() for line in hook.splitlines()
                       if "wget" in line and "/tmp/index.html" in line)
        self.assertEqual(shlex.split(request), [
            "wget", "-T", "10", "--header=Accept: text/html",
            "-O", "/tmp/index.html", "$URL/",
        ])
        self.assertIn("grep -qi 'twenty' /tmp/index.html", hook)

    def test_health_check_remains_json(self):
        hook = self.render()
        self.assertIn('wget -T 10 -O /tmp/health.json "$URL/healthz"', hook)
        self.assertIn("grep -Eq", hook)
        self.assertIn('/tmp/health.json', hook)

    def test_service_url_respects_overrides(self):
        hook = self.render("--set", "fullnameOverride=custom",
                           "--set", "server.service.port=8080")
        self.assertIn('value: "http://custom-server:8080"', hook)


if __name__ == "__main__":
    unittest.main()
