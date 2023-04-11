resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr

  tags = {
    Name = "myvpc"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "myigw"
  }
}


resource "aws_subnet" "main" {
  count      = length(var.subnet_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.subnet_cidr, count.index)
  availability_zone = element(var.aws_az, count.index]
  map_piblic_ip_on_launch = true
  tags = {
    Name = "Subnet-${count.index+1}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "pubic_route"
  }
}

resource "aws_route_table_association" "a" {
  count      = length(var.subnet_cidr)
  subnet_id      = aws_subnet.main.*.id, count.index)
  route_table_id = aws_route_table.puublic.id
}