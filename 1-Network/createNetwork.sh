#!/usr/bin/env bash

vpc_id=$(aws ec2 create-vpc \
  --cidr-block 11.0.0.0/16 \
  --tag-specification 'ResourceType=vpc,Tags=[{Key=Name,Value='$vpc_name'}]' \
  --query Vpc.VpcId \
  --output text)

echo "VPC name: $vpc_name CREATED"
echo "VPC id: $vpc_id"


export subnet_private_az_1=$(aws ec2 create-subnet \
  --vpc-id $vpc_id \
  --cidr-block 11.0.0.0/24 \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value='$vpc_name'-private-az-1}]' \
  --availability-zone $az_1 \
    --query Subnet.SubnetId \
  --output text)
export subnet_public_az_1=$(aws ec2 create-subnet \
  --vpc-id $vpc_id \
  --cidr-block 11.0.1.0/24 \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value='$vpc_name'-public-az-1}]' \
  --availability-zone $az_1 \
  --query Subnet.SubnetId \
  --output text)
export subnet_private_az_2=$(aws ec2 create-subnet \
  --vpc-id $vpc_id \
  --cidr-block 11.0.2.0/24 \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value='$vpc_name'-private-az-2}]' \
  --availability-zone $az_2 \
  --query Subnet.SubnetId \
  --output text)
export subnet_public_az_2=$(aws ec2 create-subnet \
  --vpc-id $vpc_id \
  --cidr-block 11.0.3.0/24 \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value='$vpc_name'-public-az-2}]' \
  --availability-zone $az_2 \
  --query Subnet.SubnetId \
  --output text)
export subnet_private_az_3=$(aws ec2 create-subnet \
  --vpc-id $vpc_id \
  --cidr-block 11.0.4.0/24 \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value='$vpc_name'-private-az-3}]' \
  --availability-zone $az_3 \
  --query Subnet.SubnetId \
  --output text)
export subnet_public_az_3=$(aws ec2 create-subnet \
  --vpc-id $vpc_id \
  --cidr-block 11.0.5.0/24 \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value='$vpc_name'-public-az-3}]' \
  --availability-zone $az_3 \
  --query Subnet.SubnetId \
  --output text)

echo "Subnets Ids: "$subnet_private_az_1", "$subnet_public_az_1", "$subnet_private_az_2", "$subnet_public_az_2", "$subnet_private_az_3", $subnet_public_az_3"


igw_id=$(aws ec2 create-internet-gateway \
  --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value='$vpc_name'-igw}]' \
  --query InternetGateway.InternetGatewayId \
  --output text)
aws ec2 attach-internet-gateway --vpc-id $vpc_id --internet-gateway-id $igw_id

echo "IGW id: $igw_id"


rtb_id=$(aws ec2 create-route-table \
  --vpc-id $vpc_id \
  --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value='$vpc_name'-public-subnet-rtb}]' \
  --query RouteTable.RouteTableId \
  --output text)

echo "Routing Table id: $rtb_id"


aws ec2 create-route --route-table-id $rtb_id --destination-cidr-block 0.0.0.0/0 --gateway-id $igw_id
#aws ec2 describe-route-tables --route-table-id $rtb_id

aws ec2 associate-route-table  --subnet-id $subnet_public_az_1 --route-table-id $rtb_id
aws ec2 modify-subnet-attribute --subnet-id $subnet_public_az_1 --map-public-ip-on-launch
aws ec2 associate-route-table  --subnet-id $subnet_public_az_2 --route-table-id $rtb_id
aws ec2 modify-subnet-attribute --subnet-id $subnet_public_az_2 --map-public-ip-on-launch
aws ec2 associate-route-table  --subnet-id $subnet_public_az_3 --route-table-id $rtb_id
aws ec2 modify-subnet-attribute --subnet-id $subnet_public_az_3 --map-public-ip-on-launch
