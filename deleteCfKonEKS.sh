#!/usr/bin/env bash

source ./config.sh

cd "3-CfK"
if [[ $1 == "basic" ]]; then
    source ./s1_deleteCfK.sh 
elif [[ $1 == "advanced" ]]; then
    source ./s2_deleteCfK.sh
elif [[ $1 == "external_ssl" ]]; then
    source ./s3_deleteCfK.sh
elif [[ $1 == "full_ssl" ]]; then
    source ./s4_deleteCfK.sh
else
    echo "Confluent for Kubernetes not Un-Deployed"
fi

cd ../"2-EKSCluster"
source ./deleteEKSCluster.sh

cd ../"1-Network"
source ./deleteNetwork.sh

cd ..