provider "aws" {
  region = "ap-south-1"
  profile = "default"
}

resource "aws_instance" "ec2" {
    ami = "ami-07d3a50bd29811cd1"
    instance_type = "t2.micro"
    key_name = "ans"
    vpc_security_group_ids = ["${aws_security_group.cd01-sg.id}"]
    subnet_id = "${aws_subnet.cd01-public_subent_01.id}"
}



//creating a VPC
resource "aws_vpc" "cd01-vpc" {
    cidr_block = "10.1.0.0/16"
    tags = {
      Name = "cd01-vpc"
    }
  
}

// Creatomg a Subnet 
resource "aws_subnet" "cd01-public_subent_01" {
    vpc_id = "${aws_vpc.cd01-vpc.id}"
    cidr_block = "10.1.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "cd01-public_subent_01"
    }
  
}

//Creating a Internet Gateway 
resource "aws_internet_gateway" "cd01-igw" {
    vpc_id = "${aws_vpc.cd01-vpc.id}"
    tags = {
      Name = "cd01-igw"
    }
}

// Create a route table 
resource "aws_route_table" "cd01-public-rt" {
    vpc_id = "${aws_vpc.cd01-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.cd01-igw.id}"
    }
    tags = {
      Name = "cd01-public-rt"
    }
}

// Associate subnet with routetable 

resource "aws_route_table_association" "cd01-rta-public-subent-1" {
    subnet_id = "${aws_subnet.cd01-public_subent_01.id}"
    route_table_id = "${aws_route_table.cd01-public-rt.id}"
  
}


resource "aws_security_group" "cd01-sg" {
    name = "cd01-sg"
    vpc_id = "${aws_vpc.cd01-vpc.id}"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]

    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "ssh-sg"

    }

}