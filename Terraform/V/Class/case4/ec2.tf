resource "aws_instance" "webos1" {
  ami                     = "ami-0dcc1e21636832c5d"
  instance_type           = "t2.micro"
  security_groups         = [ "web-port" ]
  key_name                = "key-name"
  
tags = {
      Name        = "Web Server"
    }
}
