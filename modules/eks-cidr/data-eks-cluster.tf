data "aws_eks_cluster" "eks_cluster" {
  name = data.terraform_remote_state.cluster.outputs.cluster-name
}

data "terraform_remote_state" "cluster" {
  backend = "s3"

  config = {
    bucket = "igcbs3terraform-state-files"
    key    = "platform/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "net" {

  backend = "s3"

  config = {
    bucket = "igcbs3terraform-state-files"
    key    = "foundation/terraform.tfstate"
    region = "us-east-2"
  }
}
