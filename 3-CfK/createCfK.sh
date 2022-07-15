#!/usr/bin/env bash

kubectl create namespace $namespace
kubectl config set-context --current --namespace $namespace

helm repo add confluentinc https://packages.confluent.io/helm
helm repo update
helm upgrade --install confluent-operator confluentinc/confluent-for-kubernetes

kubectl apply -f https://raw.githubusercontent.com/confluentinc/confluent-kubernetes-examples/master/quickstart-deploy/confluent-platform.yaml
kubectl wait --for=condition=Running pods --all --namespace $namespace --timeout=120s
kubectl apply -f https://raw.githubusercontent.com/confluentinc/confluent-kubernetes-examples/master/quickstart-deploy/producer-app-data.yaml
kubectl wait --for=condition=Running pod/elastic-0 --namespace $namespace --timeout=60s
kubectl get pods

curl -O https://confluent-for-kubernetes.s3-us-west-1.amazonaws.com/confluent-for-kubernetes-2.4.0.tar.gz
tar -xvf confluent-for-kubernetes-2.4.0.tar.gz \
   -C /usr/local/bin/


#kubectl confluent dashboard controlcenter
#kubectl confluent version