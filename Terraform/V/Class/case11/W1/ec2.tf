provider "aws" {
region     = "ap-south-1"
profile    = "default"
}

variable "type"{
    type = map
    default{
        dev = "t2.micro"
        test = "t2.small"
        prod = "t2.large"
    }
}
resource "aws_instance" "webos1" {
  ami                     = "ami-0dcc1e21636832c5d"
  instance_type           = lookup(var.type , terraform.worksapace )
  
tags = {
      Name        = "Web Server"
    }
}


output "o1"{
    value = terraform.workspace     #predifined value
}


#workspace list
#workspace new ws1
#workspace show
#terraform workspace -h
#worksapace select dev