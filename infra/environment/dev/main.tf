module "vpc" {
  source             = "../../modules/vpc"
  cidr_block         = "10.0.0.0/16"
  public_subnet_cidrs   = ["10.0.3.0/24", "10.0.4.0/24"]
  private_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zone   = ["us-west-1b", "us-west-1c"]
}

module "iam" {
  source                = "../../modules/iam"
  cluster_role_name     = "eks-cluster-role"
  node_role_name    = "eks-node-group-role"

}

module "eks" {
  source               = "../../modules/eks"
  cluster_name         = "my-eks-cluster"
  eks_cluster_role_arn  = module.iam.eks_cluster_role_arn
  eks_node_role_arn  = module.iam.eks_node_role_arn 
  private_subnet_ids          = module.vpc.private_subnet_ids
  vpc_id       = module.vpc.vpc_id
}

module "ecr" {
  source = "../../modules/ecr"
}

module "monitoring" {
  source = "../../modules/monitoring"
  eks_cluster_id                     = module.eks.eks_cluster_id
  eks_cluster_endpoint                = module.eks.eks_cluster_endpoint
  eks_cluster_certificate_authority   = module.eks.eks_cluster_certificate_authority
}

