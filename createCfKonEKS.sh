#!/usr/bin/env bash

source ./config.sh

cd "1-Network"
source ./createNetwork.sh

cd ../"2-EKSCluster"
source ./createEKSCluster.sh

cd ../"3-CfK"
if [[ $1 == "basic" ]]; then
    source ./createCfK.sh
elif [[ $1 == "advanced" ]]; then
    source ./createCfK_adv.sh
else
    echo "Confluent for Kubernetes not Deployed"
fi