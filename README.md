# Diary Infrastructure
[![Project Diary](https://img.shields.io/badge/project-diary-blue?style=flat-square&logo=git)](https://github.com/users/rasouza/projects/2)
[![Build status](https://img.shields.io/buildkite/a8cf2d43ca14c00c118b574c073f6e0f4e799af56f82a6f836/master?label=deploy&logo=kubernetes&logoColor=white&style=flat-square)](https://buildkite.com/rasouza/diary-deploy)

This repository holds all k8s YAML necessary to run [Diary](https://github.com/users/rasouza/projects/2) microservices

## Features
- ArgoCD
- NGINX Ingress Controller 1.9.0

## URLs
- ArgoCD - https://argocd.rasouza.dev

## Troubleshooting

### `Error decrypting key: googleapi: Error 403: Permission` while SOPS decrypt

Make sure you activated the right project using `gcloud config configurations activate [project-name]` then run `gcloud auth application-default login`