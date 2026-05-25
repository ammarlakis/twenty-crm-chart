precommit:
    pre-commit install

release:
    ./scripts/release.sh

docs:
    helm-docs

fmt:
    prettier --write .

lint:
    helm lint charts/twenty -f charts/twenty/values.production.example.yaml

template:
    helm template twenty charts/twenty -f charts/twenty/values.production.example.yaml

template-default-fails:
    ! helm template twenty charts/twenty
