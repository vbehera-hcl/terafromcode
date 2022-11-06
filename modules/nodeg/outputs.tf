#
# Outputs
#

locals {
  config-map-aws-auth = <<CONFIGMAPAWSAUTH
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: data.terraform_remote_state.iam.outputs.nodegroup_role_arn
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
CONFIGMAPAWSAUTH

  kubeconfig = <<KUBECONFIG
apiVersion: v1
clusters:
- cluster:
    server: aws_eks_cluster.eks-cluster.endpoint
    certificate-authority-data: aws_eks_cluster.eks-cluster.certificate_authority.0.data
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: aws
  name: aws
current-context: aws
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: aws-iam-authenticator
      args:
        - "token"
        - "-i"
        - "aws_eks_cluster.eks-cluster.name"
KUBECONFIG
}

output "config-map-aws-auth" {
  value = "local.config-map-aws-auth"
}

output "kubeconfig" {
  value = "local.kubeconfig"
}

output "ng1-name" {
  value = aws_eks_node_group.ng1.node_group_name
}

output "endpoint-node" {
  value = data.aws_eks_cluster.cluster.endpoint
}

output "ca-node" {
  value = data.aws_eks_cluster.cluster.certificate_authority[0].data
}

# Only available on Kubernetes version 1.13 and 1.14 clusters created or upgraded on or after September 3, 2019.
output "identity-oidc-issuer-node" {
  value = data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}

output "cluster-name-node" {
  value = data.aws_eks_cluster.cluster.name
}
