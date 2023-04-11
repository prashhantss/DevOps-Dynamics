variable "x" {
    default = "hello"
    type = string
}

output "o1" {
    value = var.x
}

variable "mtype" {}


variable "y" {
    type = bool
}

output "o1" {
    value = var.y ? "Prashant" : "Patil"
}



variable "y" {
    type = bool
}

output "o1" {
    value = var.y ? "Prashant" : "Patil"
}

variable "istest"{
    type = bool
}

variable "azaws"{
    default = [ "ap-south1a" , "ap-south-1b" "ap-south-1c" ]
    type = list
}


output "o1" {
    value = var.azaws
} 



variable "types" {
    type = type
    default = {
        us-east-1 = "t2.nano"
        us-south-1 = "t2.micro"
        us-east-1 = "t2.medium"
    }
}

output "o1" {
    value = var.types [ "us-south-1" ]
} 