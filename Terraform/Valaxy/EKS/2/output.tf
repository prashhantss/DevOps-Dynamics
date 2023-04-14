output "public_ip_of_eks-client" {
    description = "Public IP Of eks-client"
    value = aws_instance.eks-client.public_ip
}

output "private_ip_of_eks-client" {
    description = "Private IP Of eks-client"
    value = aws_instance.eks-client.private_ip
}