variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster."
}

variable "eks_cluster_role_arn" {
  description = "IAM Role ARN for the EKS cluster"
  type        = string
}


variable "private_subnet_ids" {
  type        = list(string)
  description = "A list of subnet IDs for the EKS cluster."
}


variable "ssh_key_name" {
  description = "SSH Key for accessing EC2 nodes"
  type        = string
  default     = "terraform"  # Replace with your key name
}

variable "eks_node_role_arn" {
  description = "IAM Role ARN for the EKS node group"
  type        = string
}
