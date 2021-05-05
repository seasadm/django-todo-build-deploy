#!/bin/bash

# Usage deploy.sh [namespace] [url] [image name]
# example:
# ./deploy.sh django-todo django-todo.poptcx.xcloud-dev.x5.ru sadm/django-todo:test01

set -x

kubectl get ns $1 || kubectl create namespace $1
kubectl -n $1 get secret registrysecret || kubectl -n $1 create secret docker-registry registrysecret --docker-username=${DOCKER_REGISTRY_LOGIN} --docker-password=${DOCKER_REGISTRY_PASSWORD} --docker-server=${DOCKER_REGISTRY}
helm upgrade --install -n $1 django-todo ./helm \
             --set global.ci_url=$2             \
             --set global.image_name=$3         \
             --wait                             \
             --timeout "600s"                   \
             --history-max 10
