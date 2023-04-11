variable "region" {
    default = "ap-south-1"
}

variable "ami" {
    type = map
    default = {
        "us-east-1" = "ami-1111"
        "us-west-1" = "ami-2222"
        "ap-south-1" = "ami-3333"
    }
}

variable "mytype" {}

output "o1"{
    value   =   lookup(var.ami , var.region)

}

provider "aws" {
region     = "ap-south-1"

}

resource "aws_instance" "webos1" {
  ami                     = lookup(var.ami , var.region)
  instance_type           = var.mytype
  
tags = {
      Name        = "Web Server"
    }
}