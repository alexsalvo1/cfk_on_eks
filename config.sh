#!/usr/bin/env bash


export region=eu-west-1
export az_1=eu-west-1a
export az_2=eu-west-1b
export az_3=eu-west-1c
export vpc_name=eksVPC-CfK
export eksClusterName=eks-cluster-cfk
export namespace=confluent
export cfk_dir=cfk-dir
export owner_email=replace-me@company.com

echo "Default Region: $region"
echo "AZ 1: $az_1"
echo "AZ 2: $az_2"
echo "AZ 3: $az_3"
echo "VPC name: $vpc_name"
echo "Cluster name: $eksClusterName"
echo "Namespace: $namespace"
echo "CfK dir: $cfk_dir"
echo "Owner email: $owner_email"