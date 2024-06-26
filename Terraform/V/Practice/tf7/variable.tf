variable "aws_region" {
    default = "ap-south-1"
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
}


variable "subnet_cidr" {
    type = list
    default = [ "10.0.1.0/24" , "10.0.2.0/24" ]
}


variable "aws_az" {
    default = [ "ap-south-1a" , "ap-south-1a" ]
}