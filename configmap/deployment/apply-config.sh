#!/bin/sh
kubectl create configmap --dry-run app-configmap --from-file=../config/default.yml --output yaml | tee app-configmap.yaml 
kubectl create configmap --dry-run env-configmap --from-env-file=../config/.env --from-env-file=../config/.env-add --output yaml | tee env-configmap.yaml 
