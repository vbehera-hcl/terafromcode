#data "terraform_remote_state" "cluster" {
#  backend = "s3"
#
#  config = {
#    bucket = "igcbs3terraform-state-files"
#    key    = "platform/terraform.tfstate"
#    region = "ap-south-1"
#  }
#}

data "aws_eks_cluster" "cluster" {
  name = var.cluster_name
}

#data "terraform_remote_state" "net" {
#
#  backend = "s3"
#
#  config = {
#    bucket = "igcbs3terraform-state-files"
#    key    = "foundation/terraform.tfstate"
#    region = "ap-south-1"
#  }
#}

#data "terraform_remote_state" "iam" {
#  backend = "s3"
#
#  config = {
#    bucket = "igcbs3terraform-state-files"
#    key    = "foundation/terraform.tfstate"
#    region = "ap-south-1"
#  }
#}
