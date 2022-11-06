data "terraform_remote_state" "net" {

  backend = "s3"

  config = {
    bucket = "igcbs3terraform-state-files"
    key    = "foundation/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "iam" {
  backend = "s3"

  config = {
    bucket = "igcbs3terraform-state-files"
    key    = "foundation/terraform.tfstate"
    region = "us-east-2"
  }
}

