#!/usr/bin/env bash

aws ec2 delete-key-pair \
  --key-name $eksClusterName-key

eksctl delete nodegroup \
  --cluster $eksClusterName \
  --region eu-west-1 \
  --name $eksClusterName-managed-node-group-large \

echo "Node Group: $eksClusterName DELETED"
#  kubectl get svc --all-namespaces (delete all with EXTERNAL_IP)
#  kubectl delete svc <service-name>


eksctl delete cluster \
  --name $eksClusterName \
  --wait

echo "EKS Cluster name: $eksClusterName DELETED"