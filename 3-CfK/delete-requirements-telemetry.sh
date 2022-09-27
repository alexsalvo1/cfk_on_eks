#!/usr/bin/env bash

kubectl delete secret telemetry \
  --namespace $namespace

helm uninstall confluent-operator --namespace $namespace
    
kubectl delete namespace $namespace