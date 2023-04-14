resource "aws_instance" "eks-client" {
 ami = var.os_name
 key_name = var.key 
 instance_type  = var.instance-type
 associate_public_ip_address = true
subnet_id = aws_subnet.demo_subnet-1.id
vpc_security_group_ids = [aws_security_group.ec2-vpc-sg.id]
}