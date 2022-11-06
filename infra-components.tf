terraform {
  backend "s3" {
    bucket = "igcbs3terraform-state-files"
    region = "ap-south-1"
    key    = "terraform.tfstate"
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

provider "aws" {
  region                   = var.aws_region
  shared_credentials_files = "~/.aws/credentials"
  profile                  = var.profile
}

module "net" {
  source = "./modules/net"

}

# No such a module
# module "peering" {
#   source = "./modules/peering"
# }

module "iam" {
  source = "./modules/iam"

}

module "cluster" {
  source = "./modules/cluster"
}

module "nodeg" {
  source     = "./modules/nodeg"
  depends_on = [module.cluster]
}

module "eks-cidr" {
  source = "./modules/eks-cidr"
}

module "lb2" {
  source = "./modules/lb2"
}

module "db_subnet_group" {
  source     = "./modules/rds/db_subnet_group"
  subnet_ids = [module.net.sub-priv5, module.net.sub-priv6]
}

module "db_parameter_group" {
  source = "./modules/rds/db_parameter_group"
  family = var.family
}

module "db_option_group" {
  source                         = "./modules/rds/db_option_group"
  engine_name                    = var.engine_name
  major_engine_version           = var.major_engine_version
  vpc_security_group_memberships = [module.net.rds-sg]
}

module "db_instance" {
  source                 = "./modules/rds/db_instance"
  vpc_security_group_ids = [module.net.rds-sg]
}
