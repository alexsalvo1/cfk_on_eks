#!/usr/bin/env bash

kubectl create namespace $namespace
kubectl config set-context --current --namespace $namespace

#helm pull confluentinc/confluent-for-kubernetes \
#  --untar --untardir=.

helm repo add confluentinc https://packages.confluent.io/helm
helm repo update
helm upgrade --install confluent-operator \
  confluentinc/confluent-for-kubernetes \
  --values confluent-for-kubernetes/new_values.yaml \
  --namespace $namespace

export api_key=xxxxx
export api_secret=xxxxx
cp resources/telemetry_template.txt resources/telemetry.txt
sed -i '' "s|<cloud_key>|$api_key|g" resources/telemetry.txt
sed -i '' "s|<cloud_secret>|$api_secret|g" resources/telemetry.txt

kubectl create secret generic telemetry \
  --from-file=telemetry.txt=resources/telemetry.txt \
  --namespace $namespace

rm resources/telemetry.txt

kubectl rollout restart deployment/confluent-operator