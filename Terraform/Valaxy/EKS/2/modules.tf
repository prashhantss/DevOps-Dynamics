module "sgs" {
  source = "./sg-eks"
  vpc_id = aws_vpc.eks-vpc.id
}

module "eks" {
  source = "./eks"
  sg_ids = module.sgs.security_group_public
  vpc_id = aws_vpc.eks-vpc.id
  subnet_ids = [ aws_subnet.eks-subnet-1.id, aws_subnet.eks-subnet-2.id ]
}