####This file contains description of miscellaneous infrastructure components
provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "wiliot-tf-back-7b0ec9ee"
    key    = "terraform/terraform.tfstate"
    region = "eu-central-1"
  }
}

