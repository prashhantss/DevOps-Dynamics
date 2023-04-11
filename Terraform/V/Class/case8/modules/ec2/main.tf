provider "aws" {
region     = "ap-south-1"
profile    = "default"
}


resource "aws_instance" "webos1" {
  ami                     = "ami-0dcc1e21636832c5d"
  instance_type           = var.mytype
  
tags = {
      Name        = "Web Server"
    }
}
