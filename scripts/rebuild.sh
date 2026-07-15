#!/bin/bash
set -e

docker build --no-cache -t hello-k8s:v2 ./app
kind load docker-image hello-k8s:v2 --name hello-k8s
kubectl rollout restart deployment hello-api
kubectl rollout status deployment hello-api