# template to launch ec2 instance


provider "aws"{
  region     = "input"
  access_key = "input"
  secret_key = "input"
}

resource "aws_instance" "input" {
  ami                     = "input"
  instance_type           = "input"
tags = {
      Environment = "input"
      Name        = "input"
    }
}