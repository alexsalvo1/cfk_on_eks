kubectl create namespace confluent
kubectl config set-context --current --namespace confluent

helm repo add confluentinc https://packages.confluent.io/helm
helm repo update

helm upgrade --install confluent-operator confluentinc/confluent-for-kubernetes

kubectl apply -f https://raw.githubusercontent.com/confluentinc/confluent-kubernetes-examples/master/quickstart-deploy/confluent-platform.yaml
sleep 60
kubectl apply -f https://raw.githubusercontent.com/confluentinc/confluent-kubernetes-examples/master/quickstart-deploy/producer-app-data.yaml
sleep 60
kubectl get pods

curl -O https://confluent-for-kubernetes.s3-us-west-1.amazonaws.com/confluent-for-kubernetes-2.4.0.tar.gz
tar -xvf kubectl-plugin/kubectl-confluent-darwin-amd64.tar.gz \
   -C /usr/local/bin/


#kubectl confluent dashboard controlcenter
#kubectl confluent version