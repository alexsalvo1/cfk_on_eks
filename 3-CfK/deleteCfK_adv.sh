#!/usr/bin/env bash

kubectl delete -f ./resources/secure-producer-app-data.yaml -n $namespace
kubectl wait --for=delete pod/elastic-0 --timeout=60s

#kubectl delete -f ./resources/zookeeper.yaml
#kubectl delete -f ./resources/broker.yaml
#kubectl delete -f ./resources/schema_registry.yaml
#kubectl delete -f ./resources/connect.yaml
#kubectl delete -f ./resources/ksqldb.yaml
#kubectl delete -f ./resources/confluent_control_center.yaml
#kubectl delete -f ./resources/rest_proxy.yaml
#kubectl wait --for=delete pods --all --namespace $confluent --timeout=60s

kubectl delete -f ./resources/confluent-platform-tls-only-external-listener.yaml

kubectl delete secret kafka-client-config-secure -n $namespace
kubectl delete secret ca-pair-sslcerts -n $namespace
#helm delete operator -n $namespace

kubectl delete namespace $namespace
#(
#NAMESPACE=your-rogue-namespace
#kubectl proxy &
#kubectl get namespace $NAMESPACE -o json |jq '.spec = {"finalizers":[]}' >temp.json
#curl -k -H "Content-Type: application/json" -X PUT --data-binary @temp.json 127.0.0.1:8001/api/v1/namespaces/$NAMESPACE/finalize
#)

rm -Rf sslcerts
rm producer.config
#rm -R cfk-dir
#rm -R confluent-for-kubernetes