module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"

  name                 = "test-vpc"
  cidr                 = "10.4.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = ["10.4.1.0/24", "10.4.2.0/24", "10.4.3.0/24"]
  public_subnets       = ["10.4.4.0/24", "10.4.5.0/24", "10.4.6.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}

resource "aws_security_group" "all" {
  name_prefix = "worker_group_mgmt_one"
  vpc_id      = module.vpc.vpc_id

ingress {
    description      = "TLS from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
}

