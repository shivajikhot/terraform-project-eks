variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster."
}

variable "cluster_role_arn" {
  type        = string
  description = "The ARN of the EKS cluster role."
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
