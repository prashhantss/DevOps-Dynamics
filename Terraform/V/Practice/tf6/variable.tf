variable "x" {
    default = "Hello"
    type = string
}
output "x" {
    value = var.x
}

variable "y" {}
output "o2" {
    value = var.y
}

variable "z" {
    type = bool
}
output "z" {
    value = var.z
}

variable "a" {
        type = bool
}

output "a" { 
        value = var.a ? "Prashant" : "Patil"
}


variable "instance_type" {
    default = "t2.micro"
    type = string
}
#terraform apply -var="instance_type=t2.midium"
output "instance_type" {
    value = var.instance_type
}


variable "mtype" {}
output "mtype" {
    value = var.mtype
}

variable "istest"{
    type = bool
}

variable "azaws"{
    default = [ "ap-south-1a" , "ap-south-1b" , "ap-south-1c" ]
    type = list
}

output "azaws" {
value = var.azaws
}    
output "azaws2" {
value = var.azaws[2]
}

variable "types" {
    type = map
    default = {
        us-east-1 = "t2.nano"
        us-south-1 = "t2.micro"
        us-east-2 = "t2.medium"
    }
}

output "types1" {
value = var.types
}
output "types2" {
value = var.types [ "us-south-1" ]
}