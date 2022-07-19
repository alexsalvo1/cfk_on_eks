#!/usr/bin/env bash

kubectl create namespace $namespace
kubectl config set-context --current --namespace $namespace

#mkdir -p $cfk_dir
#helm pull confluentinc/confluent-for-kubernetes \
#  --untar --untardir=$cfk_dir
#kubectl apply -f $cfk_dir/confluent-for-kubernetes/crds
#kubectl apply -f ./resources/cfk-permissions.yaml

helm repo add confluentinc https://packages.confluent.io/helm
helm repo update
helm upgrade --install confluent-operator confluentinc/confluent-for-kubernetes --namespace $namespace

mkdir -p sslcerts
openssl genrsa -out sslcerts/ca-key.pem 2048

openssl req -new -key sslcerts/ca-key.pem -x509 \
  -days 1000 \
  -out sslcerts/ca.pem \
  -subj "/C=US/ST=CA/L=MountainView/O=Confluent/OU=Operator/CN=TestCA"

kubectl create secret tls ca-pair-sslcerts \
  --cert=sslcerts/ca.pem \
  --key=sslcerts/ca-key.pem -n $namespace

#kubectl wait --for=condition=ready pods --all --namespace $namespace --timeout=60s
#kubectl apply -f ./resources/zookeeper.yaml
#kubectl wait --for=condition=ready pods --all --namespace $namespace --timeout=60s
#kubectl apply -f ./resources/broker.yaml
#kubectl wait --for=condition=ready pods --all --namespace $namespace --timeout=90s
#kubectl apply -f ./resources/schema_registry.yaml
#kubectl apply -f ./resources/connect.yaml
#kubectl apply -f ./resources/ksqldb.yaml
#kubectl wait --for=condition=ready pods --all --namespace $namespace --timeout=120s
#kubectl apply -f ./resources/confluent_control_center.yaml
#kubectl wait --for=condition=ready pods --all --namespace $namespace --timeout=60s
#kubectl apply -f ./resources/rest_proxy.yaml

kubectl apply -f ./resources/confluent-platform-tls-only-external-listener.yaml
kubectl wait --for=condition=ready pods --all --namespace $namespace --timeout=30s
kubectl get pods

cat <<EOF > ./resources/kafka.properties
bootstrap.servers=kafka.confluent.svc.cluster.local:9071
security.protocol=SSL
ssl.truststore.location=/mnt/sslcerts/truststore.jks
ssl.truststore.password=mystorepassword
EOF

kubectl create secret generic kafka-client-config-secure \
  --from-file=./resources/kafka.properties -n $namespace

kubectl apply -f ./resources/secure-producer-app-data.yaml -n $namespace

#kafka-console-producer    --topic test    --bootstrap-server kafka.confluent.svc.cluster.local:9092    --property parse.key=true    --property key.separator=,    --producer.config ./producer.config

#curl -O https://confluent-for-kubernetes.s3-us-west-1.amazonaws.com/confluent-for-kubernetes-2.4.0.tar.gz
#tar -xvf confluent-for-kubernetes-2.4.0.tar.gz \
#   -C /usr/local/bin/

#kubectl port-forward controlcenter-0 9021:9021
#http://localhost:9021

#kubectl confluent dashboard controlcenter
#kubectl confluent version