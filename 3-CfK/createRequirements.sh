#!/usr/bin/env bash

kubectl create namespace $namespace
kubectl config set-context --current --namespace $namespace

helm repo add confluentinc https://packages.confluent.io/helm
helm repo update
helm upgrade --install confluent-operator confluentinc/confluent-for-kubernetes --namespace $namespace