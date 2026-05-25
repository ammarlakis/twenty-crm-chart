# twenty

Helm chart for deploying [Twenty CRM](https://twenty.com) on Kubernetes.

This chart deploys the Twenty server and worker. It expects PostgreSQL and Redis
to be provided outside the chart.

## Required Values

The chart intentionally does not render with empty infrastructure settings. Set
these values in your environment-specific values file:

```yaml
serverUrl: https://twenty.example.com
redisUrl: redis://redis-master.default.svc.cluster.local:6379

database:
  host: postgresql.default.svc.cluster.local
  passwordSecret:
    name: twenty-postgresql
    key: password
```

`database.passwordSecret.name` must point to an existing Kubernetes Secret. The
chart creates a Twenty encryption Secret by default; set
`secrets.encryption.existingSecret` to use your own Secret instead.
For production, either provide your own encryption Secret or back up the Secret
created by the chart.

## Install

```sh
cp charts/twenty/values.production.example.yaml values.local.yaml
# Edit values.local.yaml with your real domains and Secret names.
helm install twenty ./charts/twenty -f values.local.yaml
```

Do not deploy the example values unchanged; they contain placeholder hostnames
and token values.

## Release

```sh
./scripts/release.sh
```

Set `RELEASE_VERSION=0.2.0` to force a version, or `RELEASE_PUSH=false` to leave
the release commit and tag local.
