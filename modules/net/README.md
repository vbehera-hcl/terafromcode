<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route_table.rtb-01](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.rtb-02](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.rtb-03](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.rtb-04](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.rtb-05](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.rtb-06](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.rtb-07](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.rtbassoc-subnet-i1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.rtbassoc-subnet-i2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.rtbassoc-subnet-i3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.rtbassoc-subnet-p1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.rtbassoc-subnet-p2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.rtbassoc-subnet-p3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.rtbassoc-subnet-p4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.rtbassoc-subnet-p5](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.rtbassoc-subnet-p6](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.rtbassoc-subnet-p7](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.allnodes-sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.cluster-sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.rds-sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.sg-01f8ab6431763bcb6](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.subnet-i1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet-i2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet-i3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet-p1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet-p2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet-p3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet-p4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet-p5](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet-p6](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet-p7](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc_endpoint.vpce-autoscaling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.vpce-ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.vpce-ecrapi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.vpce-ecrdkr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.vpce-elb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.vpce-logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.vpce-s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.vpce-ssm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.vpce-ssmmessages](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.vpce-sts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.vpce-vpce-ec2messages](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_ipv4_cidr_block_association.vpc-cidr-assoc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_ipv4_cidr_block_association) | resource |
| [aws_availability_zones.az](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster-name"></a> [cluster-name](#input\_cluster-name) | The name of the EKS Cluster | `string` | `"igcb-eks-private-cluster01"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_allnodes-sg"></a> [allnodes-sg](#output\_allnodes-sg) | n/a |
| <a name="output_aws_vpc_cidr_block"></a> [aws\_vpc\_cidr\_block](#output\_aws\_vpc\_cidr\_block) | n/a |
| <a name="output_aws_vpc_id"></a> [aws\_vpc\_id](#output\_aws\_vpc\_id) | n/a |
| <a name="output_cluster-sg"></a> [cluster-sg](#output\_cluster-sg) | n/a |
| <a name="output_eks-cidr"></a> [eks-cidr](#output\_eks-cidr) | n/a |
| <a name="output_eks-vpc"></a> [eks-vpc](#output\_eks-vpc) | n/a |
| <a name="output_rds-sg"></a> [rds-sg](#output\_rds-sg) | n/a |
| <a name="output_rtb-isol"></a> [rtb-isol](#output\_rtb-isol) | n/a |
| <a name="output_rtb-priv1"></a> [rtb-priv1](#output\_rtb-priv1) | n/a |
| <a name="output_rtb-priv2"></a> [rtb-priv2](#output\_rtb-priv2) | n/a |
| <a name="output_rtb-priv3"></a> [rtb-priv3](#output\_rtb-priv3) | n/a |
| <a name="output_rtb-priv4"></a> [rtb-priv4](#output\_rtb-priv4) | n/a |
| <a name="output_rtb-priv5"></a> [rtb-priv5](#output\_rtb-priv5) | n/a |
| <a name="output_rtb-priv6"></a> [rtb-priv6](#output\_rtb-priv6) | n/a |
| <a name="output_sub-isol1"></a> [sub-isol1](#output\_sub-isol1) | n/a |
| <a name="output_sub-isol2"></a> [sub-isol2](#output\_sub-isol2) | n/a |
| <a name="output_sub-isol3"></a> [sub-isol3](#output\_sub-isol3) | n/a |
| <a name="output_sub-priv1"></a> [sub-priv1](#output\_sub-priv1) | n/a |
| <a name="output_sub-priv2"></a> [sub-priv2](#output\_sub-priv2) | n/a |
| <a name="output_sub-priv3"></a> [sub-priv3](#output\_sub-priv3) | n/a |
| <a name="output_sub-priv4"></a> [sub-priv4](#output\_sub-priv4) | n/a |
| <a name="output_sub-priv5"></a> [sub-priv5](#output\_sub-priv5) | n/a |
| <a name="output_sub-priv6"></a> [sub-priv6](#output\_sub-priv6) | n/a |
| <a name="output_sub-priv7"></a> [sub-priv7](#output\_sub-priv7) | n/a |
<!-- END_TF_DOCS -->