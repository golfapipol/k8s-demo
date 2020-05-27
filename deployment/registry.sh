#!/bin/sh
kubectl --namespace=sample-dev create secret generic regcred \
     --from-file=.dockerconfigjson=/home/ubuntu/.docker/config.json \
     --type=kubernetes.io/dockerconfigjson