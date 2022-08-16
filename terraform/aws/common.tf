####This file contains description of miscellaneous infrastructure components
locals {
  aws_default_tags = merge(
    var.aws_tags_group_level,
    var.aws_tags_cluster_level,
  )
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

