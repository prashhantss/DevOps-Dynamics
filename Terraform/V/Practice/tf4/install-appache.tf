resource "null_resource" "nullremote" {  
  
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("/home/ansible/terraform/eks.pem")
    host        = aws_instance.webos1.public_ip
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