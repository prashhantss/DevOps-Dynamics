// Create VPC
resource "aws_vpc" "eks-vpc" {
  cidr_block = var.vpc-cidr
}

// Create Subnet-1
resource "aws_subnet" "eks-subnet-1" {
  vpc_id     = aws_vpc.eks-vpc.id 
  cidr_block = var.subnet1-cidr
  availability_zone = var.subent_az-1
  map_public_ip_on_launch = "true"
  tags = {
    Name = "eks-subnet-1"
  }
}

// Create Subnet-2
resource "aws_subnet" "eks-subnet-2" {
  vpc_id     = aws_vpc.eks-vpc.id 
  cidr_block = var.subnet2-cidr
  availability_zone = var.subent_az-2
  map_public_ip_on_launch = "true"
  tags = {
    Name = "eks-subnet-2"
  }
}

// Create Internet Gateway
resource "aws_internet_gateway" "eks-igw" {
  vpc_id = aws_vpc.eks-vpc.id
  tags = {
    Name = "eks-igw"
  }
}


// Create Route Table
resource "aws_route_table" "eks-rt" {
  vpc_id = aws_vpc.eks-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks-igw.id
  }

  tags = {
    Name = "eks-rt"
  }
}

// Subnet Association with Route Table 
resource "aws_route_table_association" "eks-rt_association-1" {
  subnet_id      = aws_subnet.eks-subnet-1.id 
  route_table_id = aws_route_table.eks-rt.id
}

// Subnet-2 Association with Route Table
resource "aws_route_table_association" "eks-rt_association-2" {
  subnet_id      = aws_subnet.eks-subnet-2.id 
  route_table_id = aws_route_table.eks-rt.id
}

// Security group for eks-client
resource "aws_security_group" "ec2-vpc-sg" {
  name        = "ec2-vpc-sg"
  vpc_id      = aws_vpc.eks-vpc.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}