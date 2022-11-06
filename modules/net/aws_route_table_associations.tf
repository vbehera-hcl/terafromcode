# aws_route_table_association.rtbassoc-subnet-i1:
resource "aws_route_table_association" "rtbassoc-subnet-i1" {
  route_table_id = aws_route_table.rtb-01.id
  subnet_id      = aws_subnet.subnet-i1.id
}

# aws_route_table_association.rtbassoc-subnet-i2:
resource "aws_route_table_association" "rtbassoc-subnet-i2" {
  route_table_id = aws_route_table.rtb-01.id
  subnet_id      = aws_subnet.subnet-i2.id
}

# aws_route_table_association.rtbassoc-subnet-i3:
resource "aws_route_table_association" "rtbassoc-subnet-i3" {
  route_table_id = aws_route_table.rtb-01.id
  subnet_id      = aws_subnet.subnet-i3.id
}

# aws_route_table_association.rtbassoc-subnet-p1:
resource "aws_route_table_association" "rtbassoc-subnet-p1" {
  route_table_id = aws_route_table.rtb-02.id
  subnet_id      = aws_subnet.subnet-p1.id
}

# aws_route_table_association.rtbassoc-subnet-p2:
resource "aws_route_table_association" "rtbassoc-subnet-p2" {
  route_table_id = aws_route_table.rtb-03.id
  subnet_id      = aws_subnet.subnet-p2.id
}

# aws_route_table_association.rtbassoc-subnet-p3:
resource "aws_route_table_association" "rtbassoc-subnet-p3" {
  route_table_id = aws_route_table.rtb-04.id
  subnet_id      = aws_subnet.subnet-p3.id
}

# aws_route_table_association.rtbassoc-subnet-p4:
resource "aws_route_table_association" "rtbassoc-subnet-p4" {
  route_table_id = aws_route_table.rtb-05.id
  subnet_id      = aws_subnet.subnet-p4.id
}

# aws_route_table_association.rtbassoc-subnet-p5:
resource "aws_route_table_association" "rtbassoc-subnet-p5" {
  route_table_id = aws_route_table.rtb-06.id
  subnet_id      = aws_subnet.subnet-p5.id
}

# aws_route_table_association.rtbassoc-subnet-p6:
resource "aws_route_table_association" "rtbassoc-subnet-p6" {
  route_table_id = aws_route_table.rtb-06.id
  subnet_id      = aws_subnet.subnet-p6.id
}

# aws_route_table_association.rtbassoc-subnet-p7:
resource "aws_route_table_association" "rtbassoc-subnet-p7" {
  route_table_id = aws_route_table.rtb-07.id
  subnet_id      = aws_subnet.subnet-p7.id
}
