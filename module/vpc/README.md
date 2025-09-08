VPC Creation with custom CIDR block

Public & Private Subnets across multiple Availability Zones

Internet Gateway (IGW) for public subnets

Route Tables for internet and private routing

Security Groups for instance-level access control

EC2 Instances deployed inside subnets

Outputs for VPC ID, Subnet IDs, and other useful information


```
provider "aws" {
  # Configuration options
  region = "Your region"
}

module "vpc" {
    source = "./module/vpc"
    vpc_config = {
        name = "My-VPC"
        cidr_block = "number"
    }

    subnet_config = {
      public_subnet_1 = {
        cidr_block = "number cidr"
        az = "regiona"
        public="true"
      }
      
      private_subnet_1 = {
        cidr_block = "10.0.1.0/24"
        az = "regionb"
      }
    }

    
}


```
