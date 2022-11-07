
resource "aws_eks_node_group" "ng1" {
  #ami_type       = "AL2_x86_64"
  depends_on     = [aws_launch_template.lt-ng1]
  cluster_name   = var.cluster_name
  disk_size      = 0
  instance_types = []
  labels = {
    "eks/cluster-name"   = var.cluster_name
    "eks/nodegroup-name" = format("ng1-%s", var.cluster_name)
  }
  node_group_name = format("ng1-%s", var.cluster_name)
  node_role_arn   = var.node_role_arn

  subnet_ids = var.subnet_ids
  tags = {
    "eks/cluster-name"                                            = var.cluster_name
    "eks/nodegroup-name"                                          = format("ng1-%s", var.cluster_name)
    "eks/nodegroup-type"                                          = "managed"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name"                 = var.cluster_name
    "kubernetes.io/cluster/data.aws_eks_cluster.eks_cluster.name" = "owned"
  }
  #version = "1.17"

  launch_template {
    name    = aws_launch_template.lt-ng1.name
    version = "1"
  }

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  timeouts {}
}


# Instance Key
resource "aws_key_pair" "eksprivatecluster" {
  key_name   = var.ssh_key_name
  public_key = file("~/.ssh/id_rsa.pub")
}
