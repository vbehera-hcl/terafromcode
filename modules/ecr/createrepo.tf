resource "aws_ecr_repository" "privaterepo" {
  name                 = "applicationimages"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}