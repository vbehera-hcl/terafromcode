resource "aws_db_option_group" "db_option_group" {
  count = var.create ? 1 : 0

  name                     = var.name
  option_group_description = var.option_group_description
  engine_name              = var.engine_name
  major_engine_version     = var.major_engine_version

  option {
    option_name                    = "SSL"
    port                           = 2484
    vpc_security_group_memberships = var.vpc_security_group_memberships
    option_settings {
      name  = "SQLNET.SSL_VERSION"
      value = "1.2"
    }
  }

  option {
    option_name = "S3_INTEGRATION"
  }

  tags = merge(
    var.tags,
    {
      "Name" = "rds-option-group"
    },
  )

  timeouts {
    delete = lookup(var.timeouts, "delete", null)
  }

  lifecycle {
    create_before_destroy = true
  }
}

