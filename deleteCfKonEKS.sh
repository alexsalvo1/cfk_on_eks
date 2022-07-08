#!/usr/bin/env bash

chmod 744 config.sh
source ./config.sh

cd "3-CfK"
chmod 744 deleteCfKonEKS.sh
source ./deleteCfKonEKS.sh

cd ../"2-EKSCluster"
chmod 744 deleteEKSCluster.sh
source ./deleteEKSCluster.sh

cd ../"1-Network"
chmod 744 deleteNetwork.sh
source ./deleteNetwork.sh

#cd ../"0-Role"
#chmod 744 deleteRole.sh
#source ./deleteRole.sh $eksClusterRole

cd ..