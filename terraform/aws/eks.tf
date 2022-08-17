# Cluster's KMS key

resource "aws_kms_key" "eks_kms_key" {
  description             = "EKS Secret Encryption Key"
  deletion_window_in_days = 7
  enable_key_rotation     = true
}

resource "aws_kms_alias" "eks" {
  name          = "alias/${var.cluster_name}"
  target_key_id = aws_kms_key.eks_kms_key.key_id
}

# EKS Cluster
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.26"

  cluster_name                    = var.cluster_name
  cluster_version                 = var.cluster_version

  # EKS Addons
  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }
    

  cluster_encryption_config = [{
    provider_key_arn = aws_kms_key.eks_kms_key.arn
    resources        = ["secrets"]
  }]

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  create_node_security_group = false
  node_security_group_id = aws_security_group.common.id
  create_cluster_security_group = false
  cluster_security_group_id = aws_security_group.common.id

  eks_managed_node_groups = {
    default = {
      # By default, the module creates a launch template to ensure tags are propagated to instances, etc.,
      # so we need to disable it to use the default template provided by the AWS EKS managed node group service
      create_launch_template = false
      launch_template_name   = ""

      # list of pods per instance type: https://github.com/awslabs/amazon-eks-ami/blob/master/files/eni-max-pods.txt
      # or run: kubectl get node -o yaml | grep pods
      instance_types = ["t2.small"]
      disk_size      = 50

      # Is deprecated and will be removed in v19.x
      create_security_group = false

      min_size     = 1
      max_size     = 3
      desired_size = 1

      update_config = {
        max_unavailable_percentage = 33
      }
    }
  }
}
