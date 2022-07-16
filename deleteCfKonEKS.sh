#!/usr/bin/env bash

source ./config.sh

cd "3-CfK"
if [[ $1 == "basic" ]]; then
    source ./deleteCfK.sh 
elif [[ $1 == "advanced" ]]; then
    source ./deleteCfK_adv.sh
else
    echo "Confluent for Kubernetes not Un-Deployed"
fi

cd ../"2-EKSCluster"
source ./deleteEKSCluster.sh

cd ../"1-Network"
source ./deleteNetwork.sh

cd ..