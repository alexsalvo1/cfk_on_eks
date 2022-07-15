#!/usr/bin/env bash

source ./config.sh

cd "3-CfK"
cd ../"3-CfK"
if $1 = "advanced"
then
    source ./deleteCfK.sh 
else
    source ./deleteCfK_adv.sh
fi

cd ../"2-EKSCluster"
source ./deleteEKSCluster.sh

cd ../"1-Network"
source ./deleteNetwork.sh

cd ..