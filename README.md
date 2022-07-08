# Confluent for Kubernetes on EKS

Deploy/undeploy Confluent for Kubernetes on Amazon Elastic Kubernetes Service 

## Requirements

* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions)
* [kubectl](https://kubernetes.io/docs/tasks/tools/)
* [eksctl](https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html)
* [AWS profile](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)

## Deploy Cluster

```console
./clusterCfKonEKS.sh
```

## Undeploy Cluster

```console
./deleteCfKonEKS.sh
```
