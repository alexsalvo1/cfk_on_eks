#!/usr/bin/env bash

chmod 744 config.sh
source ./config.sh

cd "2-EKSCluster"
chmod 744 deleteEKSCluster.sh
source ./deleteEKSCluster.sh $eksClusterName

cd "../1-Network"
chmod 744 deleteNetwork.sh
source ./deleteNetwork.sh $vpc_name

#cd ../"0-Role"
#chmod 744 deleteRole.sh
#source ./deleteRole.sh $eksClusterRole

cd ..