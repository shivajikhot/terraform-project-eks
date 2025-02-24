module "vpc" {
  source                  = "../../modules/vpc"
  cidr_block              = var.vpc_cidr_block
  public_subnet_cidrs     = var.public_subnet_cidrs
  private_subnet_cidrs    = var.private_subnet_cidrs
  availability_zone       = var.availability_zones
}

module "iam" {
  source                = "../../modules/iam"
  cluster_role_name     = var.cluster_role_name
  node_role_name        = var.node_role_name
}

module "eks" {
  source                        = "../../modules/eks"
  cluster_name                  = var.cluster_name
  eks_cluster_role_arn          = module.iam.eks_cluster_role_arn
  eks_node_role_arn             = module.iam.eks_node_role_arn
  private_subnet_ids            = module.vpc.private_subnet_ids
  vpc_id                        = module.vpc.vpc_id
}

module "ecr" {
  source = "../../modules/ecr"
}


module "monitoring" {
  source = "../../modules/monitoring"
  depends_on = [module.eks]
#  eks_cluster_id                     = module.eks.eks_cluster_id
#  eks_cluster_endpoint                = module.eks.eks_cluster_endpoint
#  eks_cluster_certificate_authority   = module.eks.eks_cluster_certificate_authority
}
