#!/usr/bin/env bash

cd ../4-CL

kubectl delete -f ./resources/clusterlink-ssl.yaml

kubectl delete -f ./resources/confluent-platform-full-SSL-CL-Destination.yaml

kubectl delete secret  password-encoder-secret \
  --namespace $namespace

kubectl delete secret rest-credential \
  --namespace $namespace

kubectl delete secret kafka-tls \
  --namespace $namespace 
