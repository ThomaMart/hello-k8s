#!/bin/bash

set -e

echo "Suppression du cluster..."
kind delete cluster --name hello-k8s || true

echo "Création du cluster..."
kind create cluster \
    --name hello-k8s \
    --config kind/kind-config.yaml

echo "Chargement de l'image..."
kind load docker-image hello-k8s:v2 --name hello-k8s

echo "Installation de NGINX Ingress..."
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

echo "Attente du contrôleur..."
kubectl wait \
  --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=180s

echo "Déploiement de l'application..."
kubectl apply -f k8s/

echo ""
echo "Cluster prêt 🚀"
