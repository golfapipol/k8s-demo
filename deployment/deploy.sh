#!/bin/sh
kubectl apply -f namespace.yml
kubectl apply -f service.yml --namespace=sample-dev
kubectl apply -f deployment.yml --namespace=sample-dev
kubectl rollout status deployment/sample-web-deployment --namespace=sample-dev