# aws_route_table.rtb-01:
resource "aws_route_table" "rtb-01" {
  propagating_vgws = []
  route            = []
  tags = {
    "Name" = format("eks-%s-cluster/IsolatedRouteTable", var.cluster-name)
  }
  vpc_id = aws_vpc.cluster.id
}

# aws_route_table.rtb-02:
resource "aws_route_table" "rtb-02" {
  propagating_vgws = []
  route            = []
  tags = {
    "Name" = "eks-cluster/PrivateRouteTableuseast2A"

  }
  vpc_id = aws_vpc.cluster.id
}

# aws_route_table.rtb-03:
resource "aws_route_table" "rtb-03" {
  propagating_vgws = []
  route            = []
  tags = {
    "Name" = "eks-cluster/PrivateRouteTableuseast2B"

  }
  vpc_id = aws_vpc.cluster.id
}

# aws_route_table.rtb-04:
resource "aws_route_table" "rtb-04" {
  propagating_vgws = []
  route            = []
  tags = {
    "Name" = "eks-cluster/PrivateRouteTableuseast2C"

  }
  vpc_id = aws_vpc.cluster.id
}

# aws_route_table.rtb-05:
resource "aws_route_table" "rtb-05" {
  propagating_vgws = []
  route            = []
  tags = {
    "Name" = "appint-route-table"

  }
  vpc_id = aws_vpc.cluster.id
}

# aws_route_table.rtb-06:
resource "aws_route_table" "rtb-06" {
  propagating_vgws = []
  route            = []
  tags = {
    "Name" = "rds-route-table"

  }
  vpc_id = aws_vpc.cluster.id
}

# aws_route_table.rtb-07:
resource "aws_route_table" "rtb-07" {
  propagating_vgws = []
  route            = []
  tags = {
    "Name" = "awsservpool-route-table"

  }
  vpc_id = aws_vpc.cluster.id
}

