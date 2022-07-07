  eksctl create nodegroup \
  --cluster salessandro-eks-cluster \
  --region eu-west-1 \
  --name salessandro-managed-node-group-large \
  --node-type t3.large \
  --nodes 3 \
  --nodes-min 2 \
  --nodes-max 4 \
  --ssh-access \
  --ssh-public-key salessandro-eks

  eksctl delete nodegroup \
  --cluster salessandro-eks-cluster \
  --region eu-west-1 \
  --name salessandro-managed-node-group-large

  kubectl get svc --all-namespaces (delete all with EXTERNAL_IP)

  kubectl delete svc <service-name>