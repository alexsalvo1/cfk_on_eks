#!/usr/bin/env bash

id=$(aws ec2 describe-vpcs \
  --filter Name=tag:Name,Values=$1 \
  --query Vpcs[].VpcId \
  --output text)
echo "VPC id: $id"

subnets_ids=$(aws ec2 describe-subnets \
  --filters "Name=vpc-id,Values="$id \
  --query Subnets[].SubnetId \
  --output text)

for i in $subnets_ids; do 
  aws ec2 delete-subnet \
    --subnet-id $i
    echo "Subnet id: $i DELETED"; 
done


aws ec2 delete-vpc \
  --vpc-id $id

echo "VPC name: $1 and Subnets DELETED"