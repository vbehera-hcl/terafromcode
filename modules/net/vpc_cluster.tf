# aws_vpc.vpc-vpc: VPC Creation
resource "aws_vpc" "cluster" {
  assign_generated_ipv6_cidr_block = false
  cidr_block                       = "10.10.0.0/22"
  enable_classiclink               = false
  enable_classiclink_dns_support   = false
  enable_dns_hostnames             = true
  enable_dns_support               = true
  tags = {
    "Name" = format("eks-%s-cluster", var.cluster-name)
  }
}

