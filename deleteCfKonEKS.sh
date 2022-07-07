#!/usr/bin/env bash

chmod 744 config.sh
source ./config.sh

cd "1 - Network"
chmod 744 deleteNetwork.sh
./deleteNetwork.sh $vpc_name

cd ../"0 - Role"
chmod 744 deleteRole.sh
./deleteRole.sh $eksClusterRole
