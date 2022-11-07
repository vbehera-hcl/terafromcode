module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 1.0"

  bucket                               = lower("${var.identifier}-db-sharespace-demo1")
  acl                                  = "private"
  attach_policy                        = true
  policy                               = data.aws_iam_policy_document.repo-access-document.json
  create_bucket                        = true
  server_side_encryption_configuration = { rule = { apply_server_side_encryption_by_default = { sse_algorithm = "AES256" } } }
  block_public_acls                    = true
  block_public_policy                  = true
  ignore_public_acls                   = true
  restrict_public_buckets              = true

}

data "aws_iam_policy_document" "repo-access-document" {
  statement {
    actions = [
      "s3:*"
    ]

    effect = "Deny"

    condition {
      test     = "Bool"
      values   = ["false"]
      variable = "aws:SecureTransport"
    }

    resources = [
      module.s3_bucket.this_s3_bucket_arn,
      "${module.s3_bucket.this_s3_bucket_arn}/*"
    ]

    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
  }
}
