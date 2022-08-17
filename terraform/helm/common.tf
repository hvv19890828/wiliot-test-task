terraform {
  backend "s3" {
    bucket = "wiliot-tf-back-7b0ec9ee"
    key    = "terraform/helm-terraform.tfstate"
    region = "eu-central-1"
  }
}

provider "helm" {
  kubernetes {
    host                   = data.terraform_remote_state.wiliot-aws-remote-tfstate.outputs.wiliot-eks-endpoint
    cluster_ca_certificate = base64decode(data.terraform_remote_state.wiliot-aws-remote-tfstate.outputs.wiliot-eks-cert)
    token                  = data.terraform_remote_state.wiliot-aws-remote-tfstate.outputs.wiliot-eks-auth-token
  }
}

provider "kubernetes" {
    host                   = data.terraform_remote_state.wiliot-aws-remote-tfstate.outputs.wiliot-eks-endpoint
    cluster_ca_certificate = base64decode(data.terraform_remote_state.wiliot-aws-remote-tfstate.outputs.wiliot-eks-cert)
    token                  = data.terraform_remote_state.wiliot-aws-remote-tfstate.outputs.wiliot-eks-auth-token
}

data "terraform_remote_state" "wiliot-aws-remote-tfstate" {
  backend = "s3"

  config = {
    bucket   = "wiliot-tf-back-7b0ec9ee"
    key      = "terraform/terraform.tfstate"
    region   = "eu-central-1"
  }
}
