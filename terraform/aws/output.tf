output "eks_cluster_id" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_id
}
