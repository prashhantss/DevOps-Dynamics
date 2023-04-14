// Security group for Worker-Nodes

resource "aws_security_group" "worker-node-sg" {
  name        = "eks-worker-sg"
  description = "Allow ssh inbound traffic"
  vpc_id      =  var.vpc_id


  ingress {
    description      = "ssh access to public"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}