provider "aws" {
  region = "ap-south-1"
  profile = "default"
}

resource "aws_instance" "ec2" {
    ami = "ami-07d3a50bd29811cd1"
    instance_type = "t2.micro"
    key_name = "ans"
}