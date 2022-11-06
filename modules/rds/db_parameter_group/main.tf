resource "aws_db_parameter_group" "db_parameter_group" {
  count = var.create ? 1 : 0

  name        = var.name
  description = var.description
  family      = var.family

  parameter {
    name  = "open_cursors"
    value = "2000"
  }

  tags = merge(
    var.tags,
    {
      "Name" = "rds-parameter-group"
    },
  )

  lifecycle {
    create_before_destroy = true
  }
}

