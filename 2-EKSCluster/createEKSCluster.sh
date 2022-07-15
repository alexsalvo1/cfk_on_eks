#!/usr/bin/env bash

echo $eksClusterName 
echo $subnet_public_az_1

eksctl create cluster \
  --name $eksClusterName \
  --region $region \
  --version 1.22 \
  --vpc-public-subnets $subnet_public_az_1,$subnet_public_az_2,$subnet_public_az_3 \
  --vpc-private-subnets $subnet_private_az_1,$subnet_private_az_2,$subnet_private_az_3 \
  --without-nodegroup

echo "EKS Cluster name: $eksClusterName CREATED"


key_pair=$(aws ec2 create-key-pair \
  --key-name $eksClusterName-key)

eksctl create nodegroup \
  --cluster $eksClusterName \
  --region $region \
  --name $eksClusterName-managed-node-group-large \
  --node-type t3.large \
  --nodes 3 \
  --nodes-min 3 \
  --nodes-max 6 \
  --ssh-access \
  --ssh-public-key $eksClusterName-key

echo "Node Group: $eksClusterName CREATED"