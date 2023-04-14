variable "location" {
    default = "ap-south-1"
}

variable "os_name" {
    default = "ami-07d3a50bd29811cd1"
}

variable "key" {
    default = "ans"
}

variable "instance-type" {
    default = "t2.micro"
}

variable "vpc-cidr" {
    default = "10.10.0.0/16"  
}

variable "subnet1-cidr" {
    default = "10.10.1.0/24"

variable "subnet2-cidr" {
    default = "10.10.2.0/24"
  
}
variable "subent_az" {
    default =  "ap-south-1a"  
}