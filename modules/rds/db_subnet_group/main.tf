resource "aws_db_subnet_group" "db_subnet_group" {
  count = var.create ? 1 : 0

  name        = var.name
  description = var.description
  subnet_ids  = var.subnet_ids

  tags = merge(
    var.tags,
    {
      "Name" = "rds-subnet-group"
    },
  )
}
