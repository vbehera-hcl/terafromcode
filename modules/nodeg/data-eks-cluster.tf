#data "terraform_remote_state" "cluster" {
#  backend = "s3"
#
#  config = {
#    bucket = "igcbs3terraform"
#    key    = "platform/terraform.tfstate"
#    region = "us-east-2"
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
#    bucket = "igcbs3terraform"
#    key    = "foundation/terraform.tfstate"
#    region = "us-east-2"
#  }
#}

#data "terraform_remote_state" "iam" {
#  backend = "s3"
#
#  config = {
#    bucket = "igcbs3terraform"
#    key    = "foundation/terraform.tfstate"
#    region = "us-east-2"
#  }
#}
