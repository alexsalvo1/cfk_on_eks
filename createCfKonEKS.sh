#!/usr/bin/env bash

source ./config.sh

cd "1-Network"
source ./createNetwork.sh

cd ../"2-EKSCluster"
source ./createEKSCluster.sh

cd ../"3-CfK"
if [[ $1 != "advanced" ]]; then
    source ./createCfK.sh
else
    source ./createCfK_adv.sh
fi