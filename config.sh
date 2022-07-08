#!/usr/bin/env bash

export eksClusterRole=${1:-eksClusterRole-CfK}
export vpc_name=eksVPC-CfK
export region=eu-west-1
export az_1=eu-west-1a
export az_2=eu-west-1b
export az_3=eu-west-1c
export eksClusterName=eks-cluster-cfk

echo "Default Region: $region"
echo "Role name: $eksClusterRole"
echo "VPC name: $vpc_name"
echo "AZ 1: $az_1"
echo "AZ 2: $az_2"
echo "AZ 3: $az_3"