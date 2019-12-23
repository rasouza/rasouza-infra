# Diary Infrastructure
This repository holds all k8s YAML necessary to run [Diary](https://github.com/users/rasouza/projects/2) microservices

## Features
- Istio 1.4
- Kong Ingress Controller 0.6.2
- Kong 1.3
- Argo CD 1.3.6

## URLs
- Grafana - [http://grafana.local](http://grafana.local)
- Kiali - [http://kiali.local](http://kiali.local)
- Prometheus - [http://prometheus.local](http://prometheus.local)
- Jaeger - [http://jaeger.local](http://jaeger.local)
- Kong Admin - [http://api.local](http://api.local)
- Argo CD - [https://argocd.local](https://argocd.local)

## How to install
It requires a k8s cluster with `LoadBalancer` enabled. See [Getting Started](https://kubernetes.io/docs/setup/) section on Kubernetes documentation for more info.

After you have a Kubernetes cluster ready:
```
git clone git@github.com:rasouza/diary-infra.git
kubectl apply -f diary-infra/base
kubectl create ns argocd
kubectl apply -n argocd -f diary-infra/argocd
```

Adds services to **Kong API Gateway**
```
sudo bash scripts/register-microservices.sh
```

## Argo CD
### Credentials
The initial password is autogenerated to be the pod name of the Argo CD API server. This can be retrieved with the command:

```
kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2
``` 

Using the username admin and the password from above, login to [Argo CD](https://argocd.local)
