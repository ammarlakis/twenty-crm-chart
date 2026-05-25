precommit:
    pre-commit install

release:
    ./scripts/release.sh

docs:
    helm-docs

fmt:
    prettier --write .

lint:
    helm lint charts/twenty

template:
    helm template twenty charts/twenty
