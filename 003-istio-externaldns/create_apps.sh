#!/bin/bash

# Create namespace and set context
kubectl create namespace 003
kubectl label namespace 003 istio-injection=enabled
kubectl config set-context --current --namespace=003

# Create deployments
kubectl create deployment hello-app-legacy --image=gcr.io/google-samples/hello-app:1.0 --port=8080
kubectl create deployment hello-app --image=gcr.io/google-samples/hello-app:2.0 --port=8080

# Expose services
kubectl expose deployment hello-app-legacy
kubectl expose deployment hello-app

# Scale deployments
kubectl scale deployment hello-app --replicas=4
kubectl scale deployment hello-app-legacy --replicas=4

# Apply istio setup
kubectl apply -f istio.yml
