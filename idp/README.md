## NOTES
This infrastructure was created from `graviteeio/am` helm chart. To generate it run:
```
helm repo add graviteeio https://helm.gravitee.io
helm template  --output-dir . --namespace idp -f values.yaml idp graviteeio/am
```

### `values.yaml`
In order to retrieve `values.yaml` you can run
```
helm show values graviteeio/am
```