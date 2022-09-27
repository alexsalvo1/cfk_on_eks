#!/usr/bin/env bash

helm uninstall confluent-operator --namespace $namespace
    
kubectl delete namespace $namespace