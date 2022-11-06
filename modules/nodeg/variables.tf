variable "cluster_name" {
  description = "The name of the EKS Cluster"
  type        = string
  default     = "igcb-eks-private-cluster01"
}

variable "node_role_arn" {
  description = "Node group role arn"
  type        = string
}
variable "subnet_ids" {
  description = "IDs of the subnet where nodes will be created"
  type        = list(string)
}

variable "ssh_key_name" {
  description = "SSh keys name to login to the node"
  type        = string
  default     = "eksprivatecluster"
}

variable "all_nodes_sg_id" {
  description = "Security group id with traffic open to all nodes"
  type        = string
}