#!/usr/bin/env bash

chmod 744 config.sh
source ./config.sh

cd "0-Role"
#chmod 744 createRole.sh
#source ./createRole.sh

cd ../"1-Network"
chmod 744 createNetwork.sh
source ./createNetwork.sh

cd ../"2-EKSCluster"
chmod 744 createEKSCluster.sh
source ./createEKSCluster.sh

cd ../"3-CfK"
chmod 744 createCfK.sh
source ./createCfK.sh