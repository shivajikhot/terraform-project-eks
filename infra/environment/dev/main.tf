module "vpc" {
  source             = "../../modules/vpc"
  cidr_block         = "10.0.0.0/16"
  public_subnet_cidrs   = ["10.0.3.0/24", "10.0.4.0/24"]
  private_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zone   = ["us-west-1b", "us-west-1c"]
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

module "iam" {
  source                = "../../modules/iam"
  cluster_role_name     = "eks-cluster-role"
  fargate_role_name     = "eks-fargate-execution-role"
}

output "eks_cluster_role_arn" {
  value = module.iam.eks_cluster_role_arn
}

output "fargate_pod_execution_role_arn" {
  value = module.iam.fargate_pod_execution_role_arn
}


module "eks" {
  source               = "../../modules/eks"
  cluster_name         = "my-eks-cluster"
  cluster_role_arn     = module.iam.eks_cluster_role_arn
  private_subnet_ids          = module.vpc.private_subnet_ids
  fargate_profile_name = "fargate-profile"
  fargate_role_arn     = module.iam.fargate_pod_execution_role_arn
  fargate_namespace    = "default"
}

output "eks_cluster_name" {
  value = module.eks.eks_cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks.eks_cluster_endpoint
}


module "ecr" {
  source = "../../modules/ecr"
}

output "patient_service_repo_uri" {
  value = module.ecr.patient_service_repo_uri
}

output "appointment_service_repo_uri" {
  value = module.ecr.appointment_service_repo_uri
}
