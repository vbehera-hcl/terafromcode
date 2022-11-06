output "eks-vpc" {
  value = aws_vpc.cluster.id
}

output "eks-cidr" {
  value = aws_vpc.cluster.cidr_block
}

output "sub-isol1" {
  value = aws_subnet.subnet-i1.id
}

output "sub-isol2" {
  value = aws_subnet.subnet-i2.id
}

output "sub-isol3" {
  value = aws_subnet.subnet-i3.id
}

output "sub-priv1" {
  value = aws_subnet.subnet-p1.id
}

output "sub-priv2" {
  value = aws_subnet.subnet-p2.id
}

output "sub-priv3" {
  value = aws_subnet.subnet-p3.id
}

output "sub-priv4" {
  value = aws_subnet.subnet-p4.id
}

output "sub-priv5" {
  value = aws_subnet.subnet-p5.id
}

output "sub-priv6" {
  value = aws_subnet.subnet-p6.id
}

output "sub-priv7" {
  value = aws_subnet.subnet-p7.id
}

output "cluster-sg" {
  value = aws_security_group.cluster-sg.id
}

output "allnodes-sg" {
  value = aws_security_group.allnodes-sg.id
}

output "rds-sg" {
  value = aws_security_group.rds-sg.id
}

output "rtb-isol" {
  value = aws_route_table.rtb-01.id
}

output "rtb-priv1" {
  value = aws_route_table.rtb-02.id
}

output "rtb-priv2" {
  value = aws_route_table.rtb-03.id
}

output "rtb-priv3" {
  value = aws_route_table.rtb-04.id
}

output "rtb-priv4" {
  value = aws_route_table.rtb-05.id
}

output "rtb-priv5" {
  value = aws_route_table.rtb-06.id
}

output "rtb-priv6" {
  value = aws_route_table.rtb-07.id
}

output "aws_vpc_cidr_block" {
  value = aws_vpc.cluster.cidr_block
}

output "aws_vpc_id" {
  value = aws_vpc.cluster.id
}

