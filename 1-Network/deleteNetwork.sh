#!/usr/bin/env bash

vpc_id=$(aws ec2 describe-vpcs \
  --filter Name=tag:Name,Values=$1 \
  --query Vpcs[].VpcId \
  --output text)
echo "VPC id: $vpc_id"
echo "VPC name: $1"


igw_id=$(aws ec2 describe-internet-gateways \
  --filter Name=tag:Name,Values=$1-igw \
  --query InternetGateways[].InternetGatewayId \
  --output text)
echo "IGW id: $igw_id"

aws ec2 detach-internet-gateway --vpc-id $vpc_id --internet-gateway-id $igw_id
aws ec2 delete-internet-gateway --internet-gateway-id $igw_id
echo "IGW id: $igw_id DELETED"; 

subnets_ids=$(aws ec2 describe-subnets \
  --filter Name=vpc-id,Values=$vpc_id \
  --query Subnets[].SubnetId \
  --output text)
echo "Subnet ids: $subnets_ids"

for i in $subnets_ids; do
  aws ec2 delete-subnet \
    --subnet-id $i
  echo "Subnet id: $i DELETED"; 
done 

rtb_id=$(aws ec2 describe-route-tables \
  --filter Name=tag:Name,Values=$1-public-subnet-rtb \
  --query 'RouteTables[*].RouteTableId' \
  --output text)
echo "Route tables id: $rtb_id"

aws ec2 delete-route-table --route-table-id $rtb_id
echo "Route table id: $rtb_id DELETED";


aws ec2 delete-vpc \
  --vpc-id $vpc_id
echo "VPC name: $1 and Subnets DELETED"