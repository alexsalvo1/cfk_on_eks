#!/usr/bin/env bash

vpc=$(aws ec2 create-vpc \
  --cidr-block 11.0.0.0/16 \
  --tag-specification 'ResourceType=vpc,Tags=[{Key=Name,Value='$1'}]' \
  --query Vpc.VpcId \
  --output text)

echo "VPC name: $1 CREATED"
echo "VPC id: $vpc"


export subnet_private_az_1=$(aws ec2 create-subnet \
  --vpc-id $vpc \
  --cidr-block 11.0.0.0/24 \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value='$1'-private-az-1}]' \
  --availability-zone $az_1 \
    --query Subnet.SubnetId \
  --output text)
export subnet_public_az_1=$(aws ec2 create-subnet \
  --vpc-id $vpc \
  --cidr-block 11.0.1.0/24 \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value='$1'-public-az-1}]' \
  --availability-zone $az_1 \
  --query Subnet.SubnetId \
  --output text)
export subnet_private_az_2=$(aws ec2 create-subnet \
  --vpc-id $vpc \
  --cidr-block 11.0.2.0/24 \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value='$1'-private-az-2}]' \
  --availability-zone $az_2 \
  --query Subnet.SubnetId \
  --output text)
export subnet_public_az_2=$(aws ec2 create-subnet \
  --vpc-id $vpc \
  --cidr-block 11.0.3.0/24 \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value='$1'-public-az-2}]' \
  --availability-zone $az_2 \
  --query Subnet.SubnetId \
  --output text)
export subnet_private_az_3=$(aws ec2 create-subnet \
  --vpc-id $vpc \
  --cidr-block 11.0.4.0/24 \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value='$1'-private-az-3}]' \
  --availability-zone $az_3 \
  --query Subnet.SubnetId \
  --output text)
export subnet_public_az_3=$(aws ec2 create-subnet \
  --vpc-id $vpc \
  --cidr-block 11.0.5.0/24 \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value='$1'-public-az-3}]' \
  --availability-zone $az_3 \
  --query Subnet.SubnetId \
  --output text)

echo "Subnets Ids: "$subnet_private_az_1", "$subnet_public_az_1", "$subnet_private_az_2", "$subnet_public_az_2", "$subnet_private_az_3", $subnet_public_az_3"

#igw = $(aws ec2 create-internet-gateway --query InternetGateway.InternetGatewayId --output text)
#aws ec2 attach-internet-gateway --vpc-id $vpc --internet-gateway-id $igw
#rtb = $(aws ec2 create-route-table --vpc-id $vpc --query RouteTable.RouteTableId --output text)
#aws ec2 create-route --route-table-id $rtb --destination-cidr-block 0.0.0.0/0 --gateway-id $igw
#aws ec2 describe-route-tables --route-table-id $rtb
#aws ec2 describe-subnets --filters "Name=vpc-id,Values=$vpc" --query "Subnets[*].{ID:SubnetId,CIDR:CidrBlock}"
#aws ec2 associate-route-table  --subnet-id $subnet1 --route-table-id $rtb
#aws ec2 modify-subnet-attribute --subnet-id $subnet1 --map-public-ip-on-launch