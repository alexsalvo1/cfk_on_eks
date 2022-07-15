# Confluent for Kubernetes on EKS

Deploy/undeploy Confluent for Kubernetes on Amazon Elastic Kubernetes Service

## Requirements

* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions)
* [kubectl](https://kubernetes.io/docs/tasks/tools/)
* [eksctl](https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html)
* [AWS profile](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)

## Scenario 1: Kubernetes cluster admin and the CFK user are the same person

### Deploy EKS Cluster and Confluent Platform

```console
./clusterCfKonEKS.sh
```

## Undeploy EKS Cluster and Confluent Platform

```console
./deleteCfKonEKS.sh
```

## Scenario 2: Kubernetes cluster admin and the CFK user are different person

### Deploy EKS Cluster and Confluent Platform (Advanced)

```console
./clusterCfKonEKS.sh advanced
```

### Undeploy EKS Cluster and Confluent Platform (Advanced)

```console
./deleteCfKonEKS.sh advanced
```
