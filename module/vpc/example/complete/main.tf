provider "aws" {
  # Configuration options
  region = "eu-north-1"
}

module "vpc" {
    source = "./module/vpc"
    vpc_config = {
        name = "My-VPC"
        cidr_block = "10.0.0.0/16"
    }

    subnet_config = {
      public_subnet_1 = {
        cidr_block = "10.0.0.0/24"
        az = "eu-north-1a"
        public="true"
      }
      public_subnet_2 = {
        cidr_block = "10.0.0.0/24"
        az = "eu-north-1a"
        public="true"
      }
      private_subnet_1 = {
        cidr_block = "10.0.1.0/24"
        az = "eu-north-1b"
      }
    }

    
}

