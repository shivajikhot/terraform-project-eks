provider "aws" {
  region = "us-west-1"
}


provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  token                  = module.eks.cluster_auth_token
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    token                  = module.eks.cluster_auth_token
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  }
}

