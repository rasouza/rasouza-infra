#!/usr/bin/env bash

helm repo add bitnami https://charts.bitnami.com/bitnami
kubectl create ns postgres
helm install -n postgres bitnami/postgresql-ha --generate-name