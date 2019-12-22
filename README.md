# Diary Infrastructure
This repository holds all k8s YAML necessary to run [Diary](https://github.com/users/rasouza/projects/2) microservices

## Features
- Istio 1.4
- Kong Ingress Controller 0.6.2
- Kong 1.3

## URLs
- Grafana - [http://grafana.local](http://grafana.local)
- Kiali - [http://kiali.local](http://kiali.local)
- Prometheus - [http://prometheus.local](http://prometheus.local)
- Jaeger - [http://jaeger.local](http://jaeger.local)
- Kong Admin - [http://api.local](http://api.local)

## How to install
It requires a k8s cluster with `LoadBalancer` enabled. See [Getting Started](https://kubernetes.io/docs/setup/) section on Kubernetes documentation for more info.

After you have a Kubernetes cluster ready:
```
git clone git@github.com:rasouza/diary-infra.git
kubectl apply -f diary-infra/base
```

Adds services to **Kong API Gateway**
```
sudo bash scripts/register-microservices.sh
```

