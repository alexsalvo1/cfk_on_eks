#!/usr/bin/env bash

kubectl delete -f https://raw.githubusercontent.com/confluentinc/confluent-kubernetes-examples/master/quickstart-deploy/producer-app-data.yaml
kubectl wait --for=delete pod/elastic-0 --timeout=60s
kubectl delete -f https://raw.githubusercontent.com/confluentinc/confluent-kubernetes-examples/master/quickstart-deploy/confluent-platform.yaml
kubectl wait --for=delete pods --all --namespace $confluent --timeout=60s
kubectl delete namespace $namespace