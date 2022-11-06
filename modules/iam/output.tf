output "cluster_service_role_arn" {
  value = aws_iam_role.eks-cluster-ServiceRole-private.arn
}

output "nodegroup_role_arn" {
  value = aws_iam_role.eks-nodegroup-ng-ma-NodeInstanceRole-private.arn
}


