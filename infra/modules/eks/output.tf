# Output EKS Cluster and Fargate Profile details
output "eks_cluster_name" {
  value = aws_eks_cluster.main.name
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "eks_cluster_id" {
  value = aws_eks_cluster.main.id
}

output "eks_cluster_certificate_authority" {
  value = aws_eks_cluster.main.certificate_authority[0].data
}

output "eks_cluster_iam_role_arn" {
  value = aws_eks_cluster.main.role_arn
}

output "cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "cluster_auth_token" {
  value = data.aws_eks_cluster_auth.cluster.token
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.main.certificate_authority[0].data
}

