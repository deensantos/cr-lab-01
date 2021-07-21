#Remote backend
terraform {
  backend "s3" {
    bucket = "cr-lab-state-files"
    key    = "global/cr-lab-01/vpc"
    region = "us-east-2"

    dynamodb_table = "remote-state-file-locks"
    encrypt        = true
  }
}

resource aws_vpc "app_01_vpc" {
  cidr_block = var.vpc_address
}

resource aws_subnet "snet_app_dev" {
   vpc_id = aws_vpc.app_01_vpc.id
   cidr_block = var.snet_dev_cidr
   availability_zone = var.az_sbnet_dev
}

resource aws_internet_gateway "vpc_gw"{
   vpc_id = aws_vpc.app_01_vpc.id
}

resource "aws_route_table" "app_01_rt"{
  vpc_id = aws_vpc.app_01_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_gw.id
  }
}

resource "aws_main_route_table_association" "app_gw_associate" {
  vpc_id         = aws_vpc.app_01_vpc.id
  route_table_id = aws_route_table.app_01_rt.id
}
