terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.10.0"
    }
  }

  backend "s3" {
    bucket = "testbackened.tf"      
    key    = "testestdemo.tfstate" 
    region = "us-east-1"            
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test123" {
  ami           = "ami-00e801948462f718a"
  instance_type = "t3.micro"

  tags = {
    Name = "test123"
  }
}

output "aws_instance_public_ip" {
  value = aws_instance.test123.public_ip
}
