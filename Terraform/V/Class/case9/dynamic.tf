provider "aws" {
region     = "ap-south-1"
profile    = "default"
}


variable "sports"{
    type = list
    default = [ 80,81,8080,8081]
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"

  dynamic "ingress" {
    for_each = var.sgports
    content {
        description      = "TLS from VPC"
        from_port        = ingress.value
        to_port          = ingress.value
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
  }
}
}