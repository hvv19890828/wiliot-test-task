data "aws_ecr_repository" "wiliot-test-app" {
  name = "wiliot-test-app"
}

data "aws_availability_zones" "available" {
}

data "aws_eks_cluster" "eks-cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "eks-cluster" {
  name = module.eks.cluster_id
}

