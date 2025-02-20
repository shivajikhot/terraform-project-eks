vpc_cidr_block         = "10.0.0.0/16"
public_subnet_cidrs    = ["10.0.3.0/24", "10.0.4.0/24"]
private_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
availability_zones     = ["us-west-1b", "us-west-1c"]
cluster_role_name      = "eks-cluster-role"
node_role_name         = "eks-node-group-role"
cluster_name           = "my-eks-cluster"
