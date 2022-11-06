variable "cluster-name" {
  description = "The name of the EKS Cluster"
  type        = string
  default     = "igcb-eks-private-cluster01"
}

variable "eks_version" {
  type    = string
  default = "1.23"
}
