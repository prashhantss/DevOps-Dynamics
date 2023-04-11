# Launch Linux EC2
# Allow web-ports in SG
# pem file
# public ssh
# install httpd
# install php -y
# Start httpd
# Terraform works on desired state and current state.


# Login

provider "aws" {
  profile                  = "customprofile"
}

# Launch Instance and SSH.

resource "aws_instance" "webos1" {
  ami                     = "ami-0dcc1e21636832c5d"
  instance_type           = "t2.micro"
  security_groups         = [ "web-port" ]
  key_name                = "key-name"
  
tags = {
      Name        = "Web Server"
    }
}


# SSH conection

resource "null_resource" "nullremote" {


  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("/key-name")
    host     = aws_instance.webos1.public_ip
  }
  
   provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo yum install php -y",
      "sudo systemctl start httpd"
    ]
  }
  
  # watch w
  
 # Create EBS volume

resource "aws_ebs_volume" "st1" {
  availability_zone = aws_instance.webos1.availability_zone
  size              = 1
  tags = {
    Name = "Web Server"
  }
}
  
  
# Attach volume to instance, fdisk -l

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.st1.id
  instance_id = aws_instance.webos1.id
}
  
  
# SSH conection

resource "null_resource" "nullremote" {


  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("/key-name")
    host     = aws_instance.webos1.public_ip
  }
  
   provisioner "remote-exec" {
    inline = [
      "sudo mkfs.ext4 /dev/xvdc",
      " sudo mount /dev/xvdc /var/www/html",
      " sudo yum install git -y",
      "git clone git_url",
    ]
    
  }
  
  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("/key-name")
    host     = aws_instance.webos1.public_ip
  }
  
   provisioner "local-exec" {
    inline = [
      comand = "chrome http://IP/web/index.php",
    ]
  }

