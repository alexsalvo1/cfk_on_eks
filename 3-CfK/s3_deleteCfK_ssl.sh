#!/usr/bin/env bash

#kubectl delete -f ./resources/secure-producer-app-data.yaml -n $namespace
#kubectl wait --for=delete pod/elastic-0 --timeout=60s

kubectl delete -f ./resources/confluent-platform-SSL.yaml

kubectl delete secret kafka-tls