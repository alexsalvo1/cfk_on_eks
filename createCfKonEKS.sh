#!/usr/bin/env bash

source ./config.sh

cd "1-Network"
source ./createNetwork.sh

cd ../"2-EKSCluster"
source ./createEKSCluster.sh

cd ../"3-CfK"
source ./create-requirements.sh
if [[ $1 == "basic" ]]; then
    source ./s1_createCfK.sh
elif [[ $1 == "advanced" ]]; then
    source ./s2_createCfK.sh
elif [[ $1 == "external_ssl" ]]; then
    source ./create-server-certificates.sh
    source ./create-client-truststore.sh ./resources/sslcerts/server/server.pem $2
    source ./s3_createCfK.sh
elif [[ $1 == "full_ssl" ]]; then
    source ./create-server-certificates.sh
    source ./create-client-truststore.sh ./resources/sslcerts/server/server.pem $2
    source ./s4_createCfK.sh
else
    echo "Confluent for Kubernetes not Deployed"
fi