#!/bin/sh
kubectl create secret generic regcred \
     --from-file=.dockerconfigjson=/home/ubuntu/.docker/config.json \
     --type=kubernetes.io/dockerconfigjson