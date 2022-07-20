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
./clusterCfKonEKS.sh basic
```

## Undeploy EKS Cluster and Confluent Platform

```console
./deleteCfKonEKS.sh basic
```

## Scenario 2: Kubernetes cluster admin and the CFK user are different person

### Deploy EKS Cluster and Confluent Platform (sdvanced)

Requirement:

* A domain already registred (sample: example.com)

```console
./clusterCfKonEKS.sh advanced <jks_password>
```

Using "kubectl get svc", Add manually these DNS definitions:
DNS name                    External IP
b0.example.com              kafka-0-lb                  (sample: xxx.elb.amazonaws.com)
b1.example.com              kafka-1-lb                  (sample: xxx.elb.amazonaws.com)
b2.example.com              kafka-2-lb                  (sample: xxx.elb.amazonaws.com)
kafka.example.com           kafka-bootstrap-lb          (sample: xxx.elb.amazonaws.com)
controlcenter.example.com   controlcenter-bootstrap-lb  (sample: xxx.elb.amazonaws.com)

Test Producer and Consumer

```console
kafka-console-producer --topic test --bootstrap-server b0.alexsalvo1.com:9092 --property parse.key=true --property key.separator=,

kafka-console-consumer --bootstrap-server b0.alexsalvo1.com:9092 --topic test --from-beginning
```

### Undeploy EKS Cluster and Confluent Platform (advanced)

```console
./deleteCfKonEKS.sh advanced
```

## Scenario 3: Kubernetes cluster admin and the CFK user are different person and External SSL

### Deploy EKS Cluster and Confluent Platform (external_ssl)

Requirement:

* A domain already registred (sample: example.com)
* Availability of keystore and truststore. Follow this url: <https://docs.confluent.io/3.0.0/kafka/ssl.html>
  * move on sslcerts folder

```console
./clusterCfKonEKS.sh external_ssl <jks_password>
```

Using "kubectl get svc", Add manually these DNS definitions:
DNS name                    External IP
b0.example.com              kafka-0-lb                  (sample: xxx.elb.amazonaws.com)
b1.example.com              kafka-1-lb                  (sample: xxx.elb.amazonaws.com)
b2.example.com              kafka-2-lb                  (sample: xxx.elb.amazonaws.com)
kafka.example.com           kafka-bootstrap-lb          (sample: xxx.elb.amazonaws.com)
controlcenter.example.com   controlcenter-bootstrap-lb  (sample: xxx.elb.amazonaws.com)

Test Producer and Consumer

Create the producer.config and consumer.config following this sample:

```console
security.protocol=SSL
ssl.truststore.location=sslcerts/client.truststore.jks
ssl.truststore.password=password
ssl.keystore.location=sslcerts/client.keystore.jks
ssl.keystore.password=password
ssl.key.password=password
```

```console
kafka-console-producer --topic test --bootstrap-server kafka.alexsalvo1.com:9092 --property parse.key=true --property key.separator=, --producer.config client-ssl.properties

kafka-console-consumer --bootstrap-server kafka.alexsalvo1.com:9092 --topic test --consumer.config client-ssl.properties --from-beginning
```

### Undeploy EKS Cluster and Confluent Platform (external_ssl)

```console
./deleteCfKonEKS.sh external_ssl
```
