#!/usr/bin/env bash
cd ../3-CfK/

kubectl create secret generic kafka-tls \
  --from-file=fullchain.pem=resources/sslcerts/server/server.pem \
  --from-file=cacerts.pem=resources/sslcerts/ca/ca.pem \
  --from-file=privkey.pem=resources/sslcerts/server/server-key.pem \
  --namespace $namespace

kubectl create secret generic rest-credential \
  --from-file=basic.txt=resources/rest-credential.txt \
  --namespace $namespace


cd ../4-CL

kubectl create secret generic password-encoder-secret \
  --from-file=password_encoder_secret=resources/password-encoder-secret.txt \
  --namespace $namespace

kubectl apply -f ./resources/confluent-platform-full-SSL-2.yaml

kubectl apply -f ./resources/clusterlink-ssl.yaml
#kubectl wait --for=condition=ready pods --all --namespace $namespace --timeout=1200s
#kubectl apply -f ./resources/secure-producer-app-data.yaml -n $namespace