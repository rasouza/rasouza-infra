## NOTES
This infrastructure was created from `bitnami/postgresql` helm chart. To generate it run:
```
helm repo add bitnami https://charts.bitnami.com/bitnami
helm template db --output-dir . --namespace postgres --values values.yaml bitnami/postgresql
```