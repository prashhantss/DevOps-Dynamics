provider "aws" {
region     = "ap-south-1"
}


resource "aws_instance" "web" {
  ami             = "ami-0d81306eddc614a45"
  instance_type   = "t2.medium"
  security_groups = ["launch-wizard-1"]
  key_name        = "eks"
  
tags = {
      Name        = "Web Server"
    }