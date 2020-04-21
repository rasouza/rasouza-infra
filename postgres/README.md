## NOTES
This infrastructure was created from `bitnami/postgresql` helm chart. To generate it run:
```
helm repo add bitnami https://charts.bitnami.com/bitnami
helm template db --output-dir . --namespace postgres --values values.yaml bitnami/postgresql
```

### `values.yaml`
In order to retrieve `values.yaml` you can run
```
helm show values bitnami/postgresql
```

### Database and User Management
Refer to https://tableplus.com/blog/2018/04/postgresql-how-to-grant-access-to-users.html