variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "cluster_role_name" {
  description = "Name of the EKS cluster IAM role"
  type        = string
}

variable "node_role_name" {
  description = "Name of the EKS node group IAM role"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}
variable "eks_cluster_id" {}
variable "eks_cluster_endpoint" {}
variable "eks_cluster_certificate_authority" {}
