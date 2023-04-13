provider "aws" {
  region = "ap-south-1"
  profile = "default"
}

resource "aws_instance" "ec2" {
    ami = "ami-07d3a50bd29811cd1"
    instance_type = "t2.micro"
    key_name = "ans"
    security_groups = ["sg01-sg"]
}

resource "aws_security_group" "sg01-sg" {
    name = "sg01-sg"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "ssh-sg"

    }

}