output "patient_service_repo_uri" {
  value = module.ecr.patient_service_repo_uri
}

output "appointment_service_repo_uri" {
  value = module.ecr.appointment_service_repo_uri
}

output "eks_cluster_name" {
  value = module.eks.eks_cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks.eks_cluster_endpoint
}

output "eks_cluster_role_arn" {
  value = module.iam.eks_cluster_role_arn
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
