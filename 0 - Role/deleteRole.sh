#!/usr/bin/env bash

aws iam detach-role-policy \
  --role-name $1 \
  --policy-arn arn:aws:iam::aws:policy/AmazonEKSClusterPolicy

echo "Policy to Role name: $1 DETACHED"


aws iam delete-role \
  --role-name $1

echo "Role name: $1 DELETED"