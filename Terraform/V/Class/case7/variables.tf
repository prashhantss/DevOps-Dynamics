variables "aws_region" {
    default = "ap-south-1"
}

variables "vpc_cidr" {
    default = "10.0.0.0/16"
}


variables "subnet_cidr" {
    type = list
    default = [ "10.0.1.0/24" , "10.0.2.0/24" ]
}


variables "aws_az" {
    default = [ "ap-south-1a" , "ap-south-1a" ]
}