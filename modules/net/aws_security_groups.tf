# AWS security group for all nodes
resource "aws_security_group" "allnodes-sg" {
  name        = "Node-sg-01"
  description = "Communication between all nodes in the cluster"
  vpc_id      = aws_vpc.cluster.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    "Name"  = format("eks-%s-cluster/ClusterSharedNodeSecurityGroup", var.cluster-name)
    "Label" = "EKS All Nodes Comms"
  }
}

# AWS security group for cluster
resource "aws_security_group" "cluster-sg" {
  name        = "Cluster-sg-01"
  description = "Communication between the control plane and worker nodegroups"
  vpc_id      = aws_vpc.cluster.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name"  = format("eks-%s-cluster/ControlPlaneSecurityGroup", var.cluster-name)
    "Label" = "EKS Control Plane & all worker nodes communications"
  }
}

# AWS security group for cluster eni
resource "aws_security_group" "sg-01f8ab6431763bcb6" {
  description = "EKS created security group applied to ENI that is attached to EKS Control Plane master nodes, as well as any managed workloads."
  vpc_id      = aws_vpc.cluster.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name"                                      = format("eks-cluster-sg-%s", var.cluster-name)
    "kubernetes.io/cluster/${var.cluster-name}" = "owned"
    "Label"                                     = "Control Plane + Managed node ENI's"
  }
}


# AWS security group for rds
resource "aws_security_group" "rds-sg" {
  name        = "rds-sg"
  description = "Communication between the RDS and EKS cluster"
  vpc_id      = aws_vpc.cluster.id

  ingress {
    from_port   = 1521
    to_port     = 1521
    protocol    = "tcp"
    cidr_blocks = [aws_vpc_ipv4_cidr_block_association.vpc-cidr-assoc.cidr_block]
    description = "VPC CIDR 2"
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.31.0.0/16"]
    description = "For Connecting DB from default VPC"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name"  = "rds-sg"
    "Label" = "RDS and EKS cluster communications"
  }
}


