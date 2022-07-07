  eksctl create cluster \
  --name salessandro-eks-cluster \
  --region eu-west-1 \
  --version 1.22 \
  --vpc-public-subnets subnet-03e340cd86804eac8,subnet-04abb6bec7f7b5930 \
  --vpc-private-subnets subnet-0dc3d3a965124389a,subnet-0932e7de0576e91ce \
  --without-nodegroup

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
  
  eksctl delete cluster \
  --name salessandro-eks-cluster