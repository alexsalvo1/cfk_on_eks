#!/usr/bin/env bash

eksctl delete cluster \
  --name $1

echo "EKS Cluster name: $1 DELETED"