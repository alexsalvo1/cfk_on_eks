#!/usr/bin/env bash

chmod 744 config.sh
source ./config.sh

cd "0 - Role"
chmod 744 createRole.sh
./createRole.sh $eksClusterRole

cd ../"1 - Network"
chmod 744 createNetwork.sh
./createNetwork.sh $vpc_name