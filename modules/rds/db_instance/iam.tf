data "aws_iam_policy_document" "s3-access-for-rds" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
      "s3:PutObject"
    ]

    effect = "Allow"

    resources = [
      module.s3_bucket.this_s3_bucket_arn,
      "${module.s3_bucket.this_s3_bucket_arn}/*"
    ]
  }
}

resource "aws_iam_policy" "s3-access-for-rds" {
  name   = "${var.identifier}-s3-access-for-rds"
  policy = data.aws_iam_policy_document.s3-access-for-rds.json
}

resource "aws_iam_role" "rds-role-for-accessing-s3-share" {
  name               = "${var.identifier}-rds-s3-integration-role"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "rds.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "connect-role-with-policy" {
  policy_arn = aws_iam_policy.s3-access-for-rds.arn
  role       = aws_iam_role.rds-role-for-accessing-s3-share.name
}
