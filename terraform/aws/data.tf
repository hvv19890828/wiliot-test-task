data "aws_ecr_image" "wiliot-test-app" {
  repository_name = "wiliot-test-app"
  image_tag       = "latest"
}

data "aws_availability_zones" "available" {
}

data "aws_eks_cluster" "eks-cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "eks-cluster" {
  name = module.eks.cluster_id
}

