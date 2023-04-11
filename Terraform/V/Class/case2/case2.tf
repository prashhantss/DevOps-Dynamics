# Environment Variables:

# export AWS_ACCESS_KEY_ID=""
# export AWS_SECRET_ACCESS_KEY=""
# export AWS_DEFAULT_REGION=""



# 1.Launch instance


provider "aws"{
  region     = "ap-south-1"
  profile    = "default"
}

resource "aws_instance" "os1" {
  ami                     = "ami_id"
  instance_type           = "type"
tags = {
      Name        = "HelloWorld"
    }
}

output "o1" {
  value = aws_instance.os1.id
}



# 2. Create EBS volume

resource "aws_ebs_volume" "st1" {
  availability_zone = aws_instance.os1.availability_zone
  size              = 10
  tags = {
    Name = "HelloWorld"
  }
}

output "o2" {
  value = aws_ebs_volume.st1.id
}

# 3. Attach volume to instance

resource "aws_volume_attachment" "ebs_att" {resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.st1.id
  instance_id = aws_instance.os1.id
}

  output "o3" {
  value = aws_volume_attachment.ebs_att