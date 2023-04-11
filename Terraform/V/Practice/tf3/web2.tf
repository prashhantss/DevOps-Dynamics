provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "p2" {
  ami             = "ami-0d81306eddc614a45"
  instance_type   = "t2.micro"
  security_groups = ["launch-wizard-1"]
  key_name        = "eks"
  tags = {
    Environment = "dev"
    Name        = "dev-1"
  }

}

resource "aws_ebs_volume" "st2" {
  availability_zone = aws_instance.p2.availability_zone
  size              = 1
  tags = {
    Name = "Web Server"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.st2.id
  instance_id = aws_instance.p2.id
}

   
resource "null_resource" "nullremote" {  
  
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("/home/ansible/terraform/practice3/eks.pem")
    host        = aws_instance.p2.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo yum install php -y",
      "sudo systemctl start httpd",
      "sudo mkfs.ext4 /dev/xvdc",
      "sudo mount /dev/xvdc /var/www/html",
      "sudo yum install git -y",
      "git clone https://github.com/prashhantss/prashhantss.git"
    ]
  }
  }