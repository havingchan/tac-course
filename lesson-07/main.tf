terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.56"
    }
  }

  required_version = ">= 1.7.3"
}

provider "aws" {
  region     = "us-east-2"
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

resource "aws_instance" "lesson_07" {
  ami           = "ami-0c7c4e3c6b4941f0f"
  instance_type = "t2.micro"
  tags = {
    Name = var.instance_name
  }
}