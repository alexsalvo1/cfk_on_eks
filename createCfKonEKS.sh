#!/usr/bin/env bash

source ./config.sh

cd "1-Network"
source ./createNetwork.sh

cd ../"2-EKSCluster"
source ./createEKSCluster.sh

cd ../"3-CfK"
source ./create-requirements.sh
if [[ $1 == "basic" ]]; then
    source ./createCfK.sh
elif [[ $1 == "advanced" ]]; then
    source ./createCfK_ssl.sh
elif [[ 21 == "external_ssl" ]]; then
    source ./create-server-certificates.sh
    source ./create-client-truststore.sh ./resources/sslcerts/server/server.pem $2
    source ./createCfK_ssl.sh
else
    echo "Confluent for Kubernetes not Deployed"
fi