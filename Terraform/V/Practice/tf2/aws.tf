provider "aws"{
  region     = "ap-south-1"
}



resource "aws_instance" "p1" {
  ami           = "ami-0d81306eddc614a45"
  instance_type = "t2.micro"
  tags = {
    Environment = "dev"
    Name        = "dev-1"
  }
}


output "o1" {
  value = aws_instance.p1.id
}



resource "aws_ebs_volume" "s1" {
  availability_zone = aws_instance.p1.availability_zone
  size              = 10
  tags = {
    Name = "EBS1"
  }
}

output "o2" {
  value = aws_ebs_volume.s1.id
}



resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdv"
  volume_id   = aws_ebs_volume.s1.id
  instance_id = aws_instance.p1.id
}

  output "o3" {
  value = aws_volume_attachment.ebs_att
}