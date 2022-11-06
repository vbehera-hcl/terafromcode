# aws_subnet.subnet-i1: Subnet Creation
resource "aws_subnet" "subnet-i1" {
  depends_on                      = [aws_vpc_ipv4_cidr_block_association.vpc-cidr-assoc]
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[0]
  cidr_block                      = "100.64.0.0/18"
  map_public_ip_on_launch         = false
  tags = {
    "Name"                                      = format("i1-%s", var.cluster-name)
    "kubernetes.io/cluster/${var.cluster-name}" = "shared"
    "PodSubnet"                                 = "subnet-i1"
  }
  vpc_id = aws_vpc.cluster.id

  timeouts {}
}

# aws_subnet.subnet-i2:
resource "aws_subnet" "subnet-i2" {
  depends_on                      = [aws_vpc_ipv4_cidr_block_association.vpc-cidr-assoc]
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[1]
  cidr_block                      = "100.64.64.0/18"
  map_public_ip_on_launch         = false
  tags = {
    "Name"                                      = format("i2-%s", var.cluster-name)
    "kubernetes.io/cluster/${var.cluster-name}" = "shared"
    "PodSubnet"                                 = "subnet-i2"
  }
  vpc_id = aws_vpc.cluster.id

  timeouts {}
}


# aws_subnet.subnet-i3:
resource "aws_subnet" "subnet-i3" {
  depends_on                      = [aws_vpc_ipv4_cidr_block_association.vpc-cidr-assoc]
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[2]
  cidr_block                      = "100.64.128.0/18"
  map_public_ip_on_launch         = false
  tags = {
    "Name"                                      = format("i3-%s", var.cluster-name)
    "kubernetes.io/cluster/${var.cluster-name}" = "shared"
    "PodSubnet"                                 = "subnet-i3"
  }
  vpc_id = aws_vpc.cluster.id

  timeouts {}
}

# aws_subnet.subnet-p1:
resource "aws_subnet" "subnet-p1" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[0]
  cidr_block                      = "10.10.0.0/25"
  map_public_ip_on_launch         = false
  tags = {
    "Name"                                      = format("Private1-EKS-%s", var.cluster-name)
    "kubernetes.io/cluster/${var.cluster-name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
    "Subnettag"                                 = "subnet-p1"
  }
  vpc_id = aws_vpc.cluster.id

  timeouts {}
}

# aws_subnet.subnet-p2:
resource "aws_subnet" "subnet-p2" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[1]
  cidr_block                      = "10.10.0.128/25"
  map_public_ip_on_launch         = false
  tags = {
    "Name"                                      = format("Private2-EKS-%s", var.cluster-name)
    "kubernetes.io/cluster/${var.cluster-name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
    "Subnettag"                                 = "subnet-p2"
  }
  vpc_id = aws_vpc.cluster.id

  timeouts {}
}

# aws_subnet.subnet-p3:

resource "aws_subnet" "subnet-p3" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[2]
  cidr_block                      = "10.10.1.0/25"
  map_public_ip_on_launch         = false
  tags = {
    "Name"                                      = format("Private3-EKS-%s", var.cluster-name)
    "kubernetes.io/cluster/${var.cluster-name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
    "Subnettag"                                 = "subnet-p3"
  }
  vpc_id = aws_vpc.cluster.id

  timeouts {}
}

# aws_subnet.subnet-p4:
resource "aws_subnet" "subnet-p4" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[0]
  cidr_block                      = "10.10.1.128/26"
  map_public_ip_on_launch         = false
  tags = {
    "Name"      = format("Private4-AppInt-%s", var.cluster-name)
    "Subnettag" = "appint-subnet"
  }
  vpc_id = aws_vpc.cluster.id

  timeouts {}
}

# aws_subnet.subnet-p5:
resource "aws_subnet" "subnet-p5" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[0]
  cidr_block                      = "10.10.1.192/27"
  map_public_ip_on_launch         = false
  tags = {
    "Name"      = format("Private5-RDS-%s", var.cluster-name)
    "Subnettag" = "rds-subnet-1"
  }
  vpc_id = aws_vpc.cluster.id

  timeouts {}
}

# aws_subnet.subnet-p6:
resource "aws_subnet" "subnet-p6" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[1]
  cidr_block                      = "10.10.1.224/27"
  map_public_ip_on_launch         = false
  tags = {
    "Name"      = format("Private6-RDS-%s", var.cluster-name)
    "Subnettag" = "rds-subnet-2"
  }
  vpc_id = aws_vpc.cluster.id

  timeouts {}
}

# aws_subnet.subnet-p7:
resource "aws_subnet" "subnet-p7" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[0]
  cidr_block                      = "10.10.2.0/24"
  map_public_ip_on_launch         = false
  tags = {
    "Name"      = format("Private7-AwsSvc-%s", var.cluster-name)
    "Subnettag" = "awsservpool-subnet"
  }
  vpc_id = aws_vpc.cluster.id

  timeouts {}
}
