resource "aws_kms_key" "ekskeyprivate" {
  description = format("EKS KMS Key %s", var.cluster-name)
}