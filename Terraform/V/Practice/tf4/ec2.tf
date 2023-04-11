
resource "aws_instance" "webos1" {
  ami             = "ami-0d81306eddc614a45"
  instance_type   = "t2.micro"
  security_groups = ["launch-wizard-1"]
  key_name        = "eks"
  
tags = {
      Name        = "Web Server"
    }
}