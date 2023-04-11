resource "aws_instance" "webos1" {
  ami                     = "ami-0dcc1e21636832c5d"
  instance_type           = var.x
  security_groups         = [ "web-port" ]
  key_name                = "key-name"
  count                   = 5
#count                   = var.istest ? : 0
  
tags = {
      Name        = "Web Server"
    }
}

