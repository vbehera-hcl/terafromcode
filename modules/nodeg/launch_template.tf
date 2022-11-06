resource "aws_launch_template" "lt-ng1" {
  instance_type          = "m5a.large"
  key_name               = var.ssh_key_name
  name                   = format("at-lt-%s-ng1", var.cluster_name)
  tags                   = {}
  image_id               = data.aws_ssm_parameter.eksami.value
  user_data              = base64encode(local.eks-node-private-userdata)
  vpc_security_group_ids = [var.all_nodes_sg_id]
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = format("%s-ng1", var.cluster_name)
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}
