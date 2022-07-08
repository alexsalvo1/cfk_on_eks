#!/usr/bin/env bash

aws iam detach-role-policy \
  --role-name $eksClusterRole \
  --policy-arn arn:aws:iam::aws:policy/AmazonEKSClusterPolicy

echo "Policy to Role name: $eksClusterRole DETACHED"


aws iam delete-role \
  --role-name $eksClusterRole

echo "Role name: $eksClusterRole DELETED"