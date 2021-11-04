data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

resource "aws_iam_policy" "worker_policy" {
  name        = "worker-policy"
  description = "Worker policy for the ALB Ingress"

  policy = file("${path.module}/iam-policy.json")
}

module "eks" {
  source                               = "terraform-aws-modules/eks/aws"
  version                              = "17.1.0"
  cluster_name                         = "${var.application}-${var.environment}"
  cluster_version                      = "1.17"
  subnets                              = [var.public_subnet-1_id, var.private_subnet-1_id]
  vpc_id                               = var.vpc_id
  cluster_endpoint_private_access      = true
  cluster_endpoint_public_access       = true
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
  enable_irsa                          = true
  workers_additional_policies          = [aws_iam_policy.worker_policy.arn]

  node_groups = [
    {
      subnet           = [var.private_subnet-1_id]
      instance_types   = ["t2.medium"]
      max_capacity     = 2
      min_capacity     = 1
      desired_capacity = 1
      disk_size        = 20
      node_group_name  = "ng1-api-${var.environment}-${var.application}"
      k8s_labels = {
        name        = "eks-node-${var.environment}-${var.application}"
        environment = var.environment
        subnet_type = "private"
        node        = "ng1"
      }
    }
  ]
}
