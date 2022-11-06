################################################################################
# TERRAFORM SETTINGS BLOCK
################################################################################

terraform {
  backend "s3" {
    bucket = "igcbs3terraform-state-files"
    region = "us-east-2"
    key    = "foundation/terraform.tfstate"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.29"
    }
  }
}

################################################################################
# PROVIDER META-ARGUMENT
################################################################################

provider "aws" {
  region                   = var.aws_region
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = var.profile
}

################################################################################
# MODULES
################################################################################

module "net" {
  source = "../../modules/net"

}

# No such a module
# module "peering" {
#   source = "../../modules/peering"
# }

module "iam" {
  source = "../../modules/iam"

}

################################################################################
# VARIABLES
################################################################################

variable "profile" {
  description = "The name of the AWS profile in the credentials file"
  type        = string
  default     = "default"
}

variable "aws_region" {
  type    = string
  default = "us-east-2"
}

variable "identifier" {
  description = "The name of the RDS instance"
  type        = string
  default     = "igcbpoc1"
}

variable "name" {
  description = "The name of the DB parameter & option group"
  type        = string
  default     = "igcbpoc"
}

variable "engine" {
  description = "The database engine to use"
  type        = string
  default     = "oracle-ee"
}

variable "engine_name" {
  description = "The database engine to use"
  type        = string
  default     = "oracle-ee"
}

variable "major_engine_version" {
  description = "Specifies the major version of the engine that this option group should be associated with"
  type        = string
  default     = "19"
}

variable "family" {
  description = "The family of the DB parameter group"
  type        = string
  default     = "oracle-ee-19"
}

################################################################################
# OUTPUTS
################################################################################

output "cluster_service_role_arn" {
  value = module.iam.cluster_service_role_arn
}

output "nodegroup_role_arn" {
  value = module.iam.nodegroup_role_arn
}

output "eks-vpc" {
  value = module.net.eks-vpc
}

output "eks-cidr" {
  value = module.net.eks-cidr
}

output "sub-isol1" {
  value = module.net.sub-isol1
}

output "sub-isol2" {
  value = module.net.sub-isol2
}

output "sub-isol3" {
  value = module.net.sub-isol3
}

output "sub-priv1" {
  value = module.net.sub-priv1
}

output "sub-priv2" {
  value = module.net.sub-priv2
}

output "sub-priv3" {
  value = module.net.sub-priv3
}

output "sub-priv4" {
  value = module.net.sub-priv4
}

output "sub-priv5" {
  value = module.net.sub-priv5
}

output "sub-priv6" {
  value = module.net.sub-priv6
}

output "sub-priv7" {
  value = module.net.sub-priv7
}

output "cluster-sg" {
  value = module.net.cluster-sg
}

output "allnodes-sg" {
  value = module.net.allnodes-sg
}

output "rds-sg" {
  value = module.net.rds-sg
}

output "rtb-isol" {
  value = module.net.rtb-isol
}

output "rtb-priv1" {
  value = module.net.rtb-priv1
}

output "rtb-priv2" {
  value = module.net.rtb-priv2
}

output "rtb-priv3" {
  value = module.net.rtb-priv3
}

output "rtb-priv4" {
  value = module.net.rtb-priv4
}

output "rtb-priv5" {
  value = module.net.rtb-priv5
}

output "rtb-priv6" {
  value = module.net.rtb-priv6
}
