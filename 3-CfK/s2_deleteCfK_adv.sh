#!/usr/bin/env bash

kubectl delete -f ./resources/secure-producer-app-data.yaml -n $namespace
kubectl delete -f https://raw.githubusercontent.com/confluentinc/confluent-kubernetes-examples/master/quickstart-deploy/producer-app-data.yaml