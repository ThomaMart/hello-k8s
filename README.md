# 🚀 Hello K8s

> A hands-on Kubernetes learning project built with **FastAPI**, **Docker** and **Kind**.

This repository documents my journey learning Kubernetes by building a complete cloud-native application from scratch.

The objective is not only to learn Kubernetes concepts but also to apply DevOps best practices through a real project that evolves over time.

---

# ✨ Features

* FastAPI REST API
* Docker containerization
* Local Kubernetes cluster with Kind
* Kubernetes Deployments
* ReplicaSets & Pods
* Services
* NGINX Ingress
* ConfigMaps
* Liveness & Readiness Probes
* Rolling Updates

Planned features:

* Secrets
* Horizontal Pod Autoscaler (HPA)
* Metrics Server
* Prometheus
* Grafana
* GitHub Actions CI/CD
* Helm
* GitOps (ArgoCD)

---

# 🏗 Architecture

```text
                Client
                   │
            http://hello.local
                   │
             NGINX Ingress
                   │
             ClusterIP Service
                   │
        ┌──────────┴──────────┐
        │                     │
     FastAPI Pod          FastAPI Pod
        │                     │
        └──────────┬──────────┘
                   │
             Kubernetes
                (Kind)
```

---

# 📂 Project structure

```text
hello-k8s/
│
├── app/
│   ├── Dockerfile
│   ├── main.py
│   └── requirements.txt
│
├── k8s/
│   ├── configmap.yaml
│   ├── deployment.yaml
│   ├── ingress.yaml
│   ├── service.yaml
│   └── hpa.yaml
│
├── kind/
│   └── kind-config.yaml
│
├── scripts/
│   ├── bootstrap.sh
│   └── rebuild.sh
│
└── README.md
```

---

# 🚀 Getting Started

## Clone the repository

```bash
git clone https://github.com/ThomaMart/hello-k8s.git
cd hello-k8s
```

## Build the Docker image

```bash
docker build -t hello-k8s:v2 ./app
```

## Create the Kind cluster

```bash
kind create cluster \
    --name hello-k8s \
    --config kind/kind-config.yaml
```

## Load the image into Kind

```bash
kind load docker-image hello-k8s:v2 --name hello-k8s
```

## Install NGINX Ingress

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
```

## Deploy the application

```bash
kubectl apply -f k8s/
```

---

# 🔎 Useful commands

Show Pods

```bash
kubectl get pods
```

Describe a Pod

```bash
kubectl describe pod <pod-name>
```

View logs

```bash
kubectl logs <pod-name>
```

Restart the Deployment

```bash
kubectl rollout restart deployment hello-api
```

Deployment status

```bash
kubectl rollout status deployment hello-api
```

Scale the application

```bash
kubectl scale deployment hello-api --replicas=5
```

---

# 📖 What I learned

This project is a practical learning lab covering:

* Docker image creation
* Kubernetes architecture
* Deployments
* ReplicaSets
* Pods
* Services
* Ingress
* ConfigMaps
* Health checks
* Rolling updates
* Troubleshooting Kubernetes workloads

More features will be added as the project evolves.

---

# 🛠 Tech Stack

* Python 3.12
* FastAPI
* Docker
* Kubernetes
* Kind
* NGINX Ingress

---

# 🎯 Project roadmap

* ✅ FastAPI API
* ✅ Docker
* ✅ Kubernetes
* ✅ Kind
* ✅ Deployment
* ✅ Service
* ✅ Ingress
* ✅ ConfigMap
* ✅ Liveness Probe
* ✅ Readiness Probe
* ⏳ Secrets
* ⏳ Rolling Update & Rollback
* ⏳ Horizontal Pod Autoscaler
* ⏳ Prometheus
* ⏳ Grafana
* ⏳ GitHub Actions
* ⏳ Helm
* ⏳ GitOps

---

# 📜 License

MIT
