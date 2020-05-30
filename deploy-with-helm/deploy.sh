#!/bin/sh
helm install --set image.repository=nginx:1.17  web sample-web