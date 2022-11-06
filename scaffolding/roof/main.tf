################################################################################
# TERRAFORM SETTINGS BLOCK
################################################################################
terraform {
  backend "s3" {
    bucket = "igcbs3terraform"
    region = "us-east-2"
    key    = "roof/terraform.tfstate"
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
module "eks-cidr" {
  source = "../../modules/eks-cidr"
}

module "lb2" {
  source = "../../modules/lb2"
}
