provider "aws"{
region ="ap-south-1"
}

resource "aws_instance" "webos1" {
  ami             = "ami-0d81306eddc614a45"
  instance_type   = var.mytype
  

tags = {
      Name        = "Web Server"
    }
}