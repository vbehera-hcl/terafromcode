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
| [aws_iam_role.eks-cluster-ServiceRole-private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks-nodegroup-ng-ma-NodeInstanceRole-private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.eks-cluster-ServiceRole-private__eks-cluster-PolicyCloudWatchMetrics](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.eks-cluster-ServiceRole-private__eks-cluster-PolicyELBPermissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.eks-nodegroup-ng-ma-NodeInstanceRole-private__eks-nodegroup-ng-maneksami2-PolicyALBIngress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.eks-nodegroup-ng-ma-NodeInstanceRole-private__eks-nodegroup-ng-maneksami2-PolicyAutoScaling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.eks-nodegroup-ng-ma-NodeInstanceRole-private__eks-nodegroup-ng-maneksami2-PolicyCertManagerChangeSet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.eks-nodegroup-ng-ma-NodeInstanceRole-private__eks-nodegroup-ng-maneksami2-PolicyCertManagerGetChange](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.eks-nodegroup-ng-ma-NodeInstanceRole-private__eks-nodegroup-ng-maneksami2-PolicyCertManagerHostedZones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.eks-nodegroup-ng-ma-NodeInstanceRole-private__eks-nodegroup-ng-maneksami2-PolicyEBS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.eks-nodegroup-ng-ma-NodeInstanceRole-private__eks-nodegroup-ng-maneksami2-PolicyEFS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.eks-nodegroup-ng-ma-NodeInstanceRole-private__eks-nodegroup-ng-maneksami2-PolicyEFSEC2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.eks-cluster-ServiceRole-private__AmazonEKSClusterPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-cluster-ServiceRole-private__AmazonEKSVPCResourceController](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-nodegroup-ng-ma-NodeInstanceRole-private__AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-nodegroup-ng-ma-NodeInstanceRole-private__AmazonEC2RoleforSSM](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-nodegroup-ng-ma-NodeInstanceRole-private__AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-nodegroup-ng-ma-NodeInstanceRole-private__AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-nodegroup-ng-ma-NodeInstanceRole-private__AmazonSSMManagedInstanceCore](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-nodegroup-ng-ma-NodeInstanceRole-private__CloudWatchAgentServerPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_key_pair.eksprivatecluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_service_role_arn"></a> [cluster\_service\_role\_arn](#output\_cluster\_service\_role\_arn) | n/a |
| <a name="output_key_name"></a> [key\_name](#output\_key\_name) | n/a |
| <a name="output_nodegroup_role_arn"></a> [nodegroup\_role\_arn](#output\_nodegroup\_role\_arn) | n/a |
<!-- END_TF_DOCS -->