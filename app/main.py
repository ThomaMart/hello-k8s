from fastapi import FastAPI
import socket
import os
import platform

app = FastAPI(
    title="Hello Kubernetes API",
    version="1.0.0"
)

HOSTNAME = socket.gethostname()

MESSAGE = os.getenv("MESSAGE", "Bonjour Kubernetes !")
ENVIRONMENT = os.getenv("ENVIRONMENT", "dev")
VERSION = os.getenv("VERSION", "1.0.0")


@app.get("/")
def root():
    return {
        "message": MESSAGE,
        "hostname": HOSTNAME
    }


@app.get("/health")
def health():
    return {
        "status": "UP"
    }


@app.get("/ready")
def ready():
    return {
        "ready": True
    }


@app.get("/info")
def info():
    return {
        "application": "hello-k8s",
        "version": VERSION,
        "environment": ENVIRONMENT,
        "hostname": HOSTNAME,
        "python": platform.python_version(),
        "message": MESSAGE
    }