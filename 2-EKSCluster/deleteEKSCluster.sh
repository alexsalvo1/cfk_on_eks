#!/usr/bin/env bash

eksctl delete cluster \
  --name $1 \
  --wait

echo "EKS Cluster name: $1 DELETED"

#eksctl delete nodegroup \
#  --cluster salessandro-eks-cluster \
#  --region eu-west-1 \
#  --name salessandro-managed-node-group-large

#  kubectl get svc --all-namespaces (delete all with EXTERNAL_IP)

#  kubectl delete svc <service-name>