resource "aws_instance" "p2" {
  ami             = "ami-0d81306eddc614a45"
  #instance_type   = var.instance_type
instance_type = var.types [ "us-east-1" ]
  security_groups = ["launch-wizard-1"]
  key_name        = "eks"
  #count           = 2
  count          = var.istest ?  0 : 1
  availability_zone = var.azaws[2]
  tags = {
    Environment = "dev"
    Name        = "dev-1"
  }

}