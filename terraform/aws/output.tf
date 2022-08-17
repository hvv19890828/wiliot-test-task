output "eks_cluster_id" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_id
}

output "wiliot-test-app-image" {
  description = "Wiliot test-app image link"
  value       = data.aws_ecr_repository.wiliot-test-app.repository_url
}

output "wiliot-eks-endpoint" {
  description = "Wiliot EKS endpoint"
  value       = data.aws_eks_cluster.eks-cluster.endpoint
}

output "wiliot-eks-auth-token" {
  description = "Wiliot EKS auth-token"
  value       = data.aws_eks_cluster_auth.eks-cluster.token
  sensitive = true
}

output "wiliot-eks-cert" {
  description = "Wiliot EKS cert"
  value       = data.aws_eks_cluster.eks-cluster.certificate_authority[0].data
  sensitive = true
}

