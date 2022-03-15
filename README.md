# Diary Infrastructure
[![Project Diary](https://img.shields.io/badge/project-diary-blue?style=flat-square&logo=git)](https://github.com/users/rasouza/projects/2)
[![Build status](https://img.shields.io/buildkite/a8cf2d43ca14c00c118b574c073f6e0f4e799af56f82a6f836/master?label=deploy&logo=kubernetes&logoColor=white&style=flat-square)](https://buildkite.com/rasouza/diary-deploy)

It contains manifests for a Kubernetes infrastructure

## Features

- [NGINX Ingress Controller](https://kubernetes.github.io/ingress-nginx/)
- [KubeVela](https://kubevela.io/)
- [Consul](https://www.consul.io/)
- [Vault](https://www.vaultproject.io/)
- [External Secrets](https://external-secrets.io/)
- [GrowthBook](https://www.growthbook.io/)

## Frontends

### Vault

Run

```
kubectl port-forward vault-0 8200:8200
```

Then access http://localhost:8200

### Growthbook

Growthbook has a URL set up to http://feature.k8s.local. You have 2 ways to approach it:

#### Add it to `/etc/hosts` file
```
sudo sh -c 'echo "127.0.0.1 http://feature.k8s.local" >> /etc/hosts'
```

#### Change ingress host

Manifest can be found at [apps/growthbook.yaml](apps/growthbook.yaml)