#!/usr/bin/env bash

output=$(aws iam create-role \
  --role-name eksClusterRole-CfK \
  --assume-role-policy-document file://./cluster-trust-policy.json)

echo "Role name: $eksClusterRole CREATED"
echo "json: $output"


aws iam attach-role-policy \
  --policy-arn arn:aws:iam::aws:policy/AmazonEKSClusterPolicy \
  --role-name $eksClusterRole

echo "Policy to Role name: $eksClusterRole ATTACHED"