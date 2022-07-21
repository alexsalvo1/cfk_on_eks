#!/usr/bin/env bash

kubectl apply -f ./resources/confluent-platform.yaml
kubectl wait --for=condition=ready pods --all --namespace $namespace --timeout=30s
#kubectl get pods
kubectl apply -f https://raw.githubusercontent.com/confluentinc/confluent-kubernetes-examples/master/quickstart-deploy/producer-app-data.yaml