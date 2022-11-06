################################################################################
# TERRAFORM SETTINGS BLOCK
################################################################################

terraform {
  backend "s3" {
    bucket = "igcbs3terraform"
    region = "us-east-2"
    key    = "platform/terraform.tfstate"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.29"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.5.1"
    }
  }
}

################################################################################
# PROVIDER META-ARGUMENTS
################################################################################

provider "aws" {
  region                   = var.aws_region
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = var.profile
}

################################################################################
# MODULES
################################################################################
data "aws_eks_cluster" "cluster" {
  name = var.cluster-name
}

data "aws_subnet" "priv1" {
  filter {
    name   = "tag:Name"
    values = ["Private1-*"]
  }
}

data "aws_subnet" "priv2" {
  filter {
    name   = "tag:Name"
    values = ["Private2-*"]
  }
}

data "aws_subnet" "priv3" {
  filter {
    name   = "tag:Name"
    values = ["Private3-*"]
  }
}

data "aws_iam_role" "node" {
  name = "eks-nodegroup-ng-ma-NodeInstanceRole-private"
}

data "aws_security_group" "all_nodes" {
  filter {
    name   = "tag:Label"
    values = ["EKS All Nodes Comms"]
  }
}

module "cluster" {
  source = "../../modules/cluster"
}

module "nodeg" {
  source          = "../../modules/nodeg"
  cluster_name    = var.cluster-name
  subnet_ids      = [data.aws_subnet.priv1.id, data.aws_subnet.priv2.id, data.aws_subnet.priv3.id]
  node_role_arn   = data.aws_iam_role.node.arn
  all_nodes_sg_id = data.aws_security_group.all_nodes.id
  ssh_key_name    = var.ssh_key_name
  depends_on      = [module.cluster]
}
################################################################################
# VARIABLES
################################################################################

variable "environment" {
  type    = string
  default = "poc"
}

variable "profile" {
  description = "The name of the AWS profile in the credentials file"
  type        = string
  default     = "default"
}

variable "aws_region" {
  type    = string
  default = "us-east-2"
}

variable "eks_version" {
  type    = string
  default = "1.22"
}

variable "cluster-name" {
  description = "The name of the EKS Cluster"
  type        = string
  default     = "igcb-eks-private-cluster01"
}

variable "ssh_key_name" {
  description = "SSH key name"
  type        = string
  default     = "eksprivatecluster"
}

################################################################################
# OUTPUTS
################################################################################
output "cluster-name" {
  value = module.cluster.cluster-name
}

output "cluster-sg-01" {
  value = module.cluster.cluster-sg-01
}

output "ca" {
  value     = module.cluster.ca
  sensitive = true
}

output "endpoint" {
  value = module.cluster.endpoint
}

output "oidc_provider_arn" {
  value = module.cluster.oidc_provider_arn
}

output "config-map-aws-auth" {
  value = module.nodeg.config-map-aws-auth
}

output "kubeconfig" {
  value = module.nodeg.kubeconfig
}

output "ng1-name" {
  value = module.nodeg.ng1-name
}

output "endpoint-node" {
  value = module.nodeg.endpoint-node
}

output "ca-node" {
  value     = module.nodeg.ca-node
  sensitive = true
}

output "identity-oidc-issuer-node" {
  value = module.nodeg.identity-oidc-issuer-node
}

output "cluster-name-node" {
  value = module.nodeg.cluster-name-node
}
