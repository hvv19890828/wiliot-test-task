####This file contains description of miscellaneous infrastructure components
locals {
  aws_default_tags = merge(
    var.aws_tags_group_level,
    var.aws_tags_cluster_level,
  )
}

terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  default_tags {
    tags = local.aws_default_tags
  }
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "wiliot-tf-back-7b0ec9ee"
    key    = "terraform/terraform.tfstate"
    region = "eu-central-1"
  }
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks-cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks-cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks-cluster.token
}

