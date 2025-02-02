variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "cluster_role_name" {
  description = "IAM Role for EKS Cluster"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "ssh_key_name" {
  description = "SSH Key for accessing EC2 nodes"
  type        = string
}
