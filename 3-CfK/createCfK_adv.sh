#!/usr/bin/env bash

kubectl create namespace $namespace
kubectl config set-context --current --namespace $namespace

mkdir -p $cfk_dir
#helm pull confluentinc/confluent-for-kubernetes \
#  --untar --untardir=$cfk_dir
#kubectl apply -f $cfk_dir/confluent-for-kubernetes/crds
#kubectl apply -f ./resources/cfk-permissions.yaml

helm repo add confluentinc https://packages.confluent.io/helm
helm repo update
helm upgrade --install confluent-operator confluentinc/confluent-for-kubernetes --namespace $namespace
kubectl wait --for=condition=ready pods --all --namespace $namespace --timeout=60s
kubectl apply -f ./resources/zookeeper.yaml
kubectl wait --for=condition=ready pods --all --namespace $namespace --timeout=60s
kubectl apply -f ./resources/broker.yaml
kubectl wait --for=condition=ready pods --all --namespace $namespace --timeout=90s
kubectl apply -f ./resources/schema_registry.yaml
kubectl apply -f ./resources/connect.yaml
kubectl apply -f ./resources/ksqldb.yaml
kubectl wait --for=condition=ready pods --all --namespace $namespace --timeout=120s
kubectl apply -f ./resources/confluent_control_center.yaml
kubectl wait --for=condition=ready pods --all --namespace $namespace --timeout=60s
kubectl apply -f ./resources/rest_proxy.yaml
kubectl wait --for=condition=ready pods --all --namespace $namespace --timeout=30s
kubectl apply -f https://raw.githubusercontent.com/confluentinc/confluent-kubernetes-examples/master/quickstart-deploy/producer-app-data.yaml
kubectl wait --for=condition=ready pod/elastic-0 --namespace $namespace --timeout=60s
kubectl get pods

#curl -O https://confluent-for-kubernetes.s3-us-west-1.amazonaws.com/confluent-for-kubernetes-2.4.0.tar.gz
#tar -xvf confluent-for-kubernetes-2.4.0.tar.gz \
#   -C /usr/local/bin/

#kubectl port-forward controlcenter-0 9021:9021
#http://localhost:9021

#kubectl confluent dashboard controlcenter
#kubectl confluent version