#!/usr/bin/env bash

kubectl delete -f https://raw.githubusercontent.com/confluentinc/confluent-kubernetes-examples/master/quickstart-deploy/producer-app-data.yaml
kubectl wait --for=delete pod/elastic-0 --timeout=60s

kubectl delete -f ./resources/zookeeper.yaml
kubectl delete -f ./resources/broker.yaml
kubectl delete -f ./resources/schema_registry.yaml
kubectl delete -f ./resources/connect.yaml
kubectl delete -f ./resources/ksqldb.yaml
kubectl delete -f ./resources/confluent_control_center.yaml
kubectl delete -f ./resources/rest_proxy.yaml
kubectl wait --for=delete pods --all --namespace $confluent --timeout=60s
#kubectl delete -f ./resources/cfk-permissions.yaml
#kubectl delete -f $cfk_dir/confluent-for-kubernetes/crds
kubectl delete namespace $namespace

rm -R cfk-dir
rm -R confluent-for-kubernetes