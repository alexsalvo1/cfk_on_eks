#!/usr/bin/env bash

chmod 744 config.sh
source ./config.sh

cd "0-Role"
#chmod 744 createRole.sh
#source ./createRole.sh $eksClusterRole

cd ../"1-Network"
chmod 744 createNetwork.sh
source ./createNetwork.sh $vpc_name

cd ../"2-EKSCluster"
chmod 744 createEKSCluster.sh
source ./createEKSCluster.sh $eksClusterName

cd ..