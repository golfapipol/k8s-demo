#!/bin/sh
export IMAGE=$1
timestamp=$(date +%s)
envsubst < deployment.yml > deployment-$timestamp.yml
kubectl apply -f deployment-$timestamp.yml