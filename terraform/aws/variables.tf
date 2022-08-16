# Storage

variable "wiliot-tf-back-s3" {
  description = "Wiliot terraform S3 backend bucket name"
  default = "wiliot-tf-back"
}

# Storage


# EKS

variable "cluster_name" {
  default = "wiliot-test-eks"
}

variable "aws_auth_roles" {
  description = "Additional IAM roles to add to the aws-auth ConfigMap"
  type        = list(any)
  default     = []
}


variable "cluster_version" {
  description = "Desired kubernetes version. If you do not specify a value, the latest available version is used"
  type        = string
}

variable "eks_managed_node_groups" {
  description = "Map of maps of eks_node_groups to create"
  type        = any
}

# EKS


# Networking

variable "aws_private_subnets" {
  description = "List of private subnets for the worker nodes"
  type        = list(string)
}

variable "aws_public_subnets" {
  description = "List of public subnets for the worker nodes"
  type        = list(string)
}

variable "aws_vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

# Networking


# Tags

variable "aws_tags_group_level" {
  description = "A map group of tags to add to all resources"
  type        = map(string)
}

variable "aws_tags_cluster_level" {
  description = "A map of cluster tags to add to all resources"
  type        = map(string)
}

# Tags





