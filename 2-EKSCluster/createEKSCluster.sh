#!/usr/bin/env bash

echo $1 
echo $subnet_public_az_1

eksctl create cluster \
  --name $1 \
  --region eu-west-1 \
  --version 1.22 \
  --vpc-public-subnets $subnet_public_az_1,$subnet_public_az_2,$subnet_public_az_3 \
  --vpc-private-subnets $subnet_private_az_1,$subnet_private_az_2,$subnet_private_az_3 \
  --without-nodegroup

echo "EKS Cluster name: $1 CREATED"