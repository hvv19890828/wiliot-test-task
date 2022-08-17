# Storage

variable "wiliot-tf-back-s3" {
  description = "Wiliot terraform S3 backend bucket name"
  default     = "wiliot-tf-back"
}

# Storage


# EKS

variable "cluster_name" {
  default = "wiliot-test-eks"
}

variable "cluster_version" {
  description = "Desired kubernetes version. If you do not specify a value, the latest available version is used"
  type        = string
}

# EKS


# Networking

variable "aws_private_subnets" {
  description = "List of private subnets for the worker nodes"
  type        = list(string)
  default     = ["172.16.0.0/24", "172.16.1.0/24", "172.16.2.0/24"]
}

variable "aws_public_subnets" {
  description = "List of public subnets for the worker nodes"
  type        = list(string)
  default     = ["172.16.3.0/24", "172.16.4.0/24", "172.16.5.0/24"]
}

variable "aws_vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "172.16.0.0/21"
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





