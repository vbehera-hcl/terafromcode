output "cluster_service_role_arn" {
  value = module.iam.cluster_service_role_arn
}

output "nodegroup_role_arn" {
  value = module.iam.nodegroup_role_arn
}

output "key_name" {
  value = module.iam.key_name
}

output "eks-vpc" {
  value = module.net.eks-vpc
}

output "eks-cidr" {
  value = module.net.eks-cidr
}

output "sub-isol1" {
  value = module.net.sub-isol1
}

output "sub-isol2" {
  value = module.net.sub-isol2
}

output "sub-isol3" {
  value = module.net.sub-isol3
}

output "sub-priv1" {
  value = module.net.sub-priv1
}

output "sub-priv2" {
  value = module.net.sub-priv2
}

output "sub-priv3" {
  value = module.net.sub-priv3
}

output "sub-priv4" {
  value = module.net.sub-priv4
}

output "sub-priv5" {
  value = module.net.sub-priv5
}

output "sub-priv6" {
  value = module.net.sub-priv6
}

output "sub-priv7" {
  value = module.net.sub-priv7
}

output "cluster-sg" {
  value = module.net.cluster-sg
}

output "allnodes-sg" {
  value = module.net.allnodes-sg
}

output "rds-sg" {
  value = module.net.rds-sg
}

output "rtb-isol" {
  value = module.net.rtb-isol
}

output "rtb-priv1" {
  value = module.net.rtb-priv1
}

output "rtb-priv2" {
  value = module.net.rtb-priv2
}

output "rtb-priv3" {
  value = module.net.rtb-priv3
}

output "rtb-priv4" {
  value = module.net.rtb-priv4
}

output "rtb-priv5" {
  value = module.net.rtb-priv5
}

output "rtb-priv6" {
  value = module.net.rtb-priv6
}

output "cluster-name" {
  value = module.cluster.cluster-name
}

output "cluster-sg-01" {
  value = module.cluster.cluster-sg-01
}

output "ca" {
  value = module.cluster.ca
}

output "endpoint" {
  value = module.cluster.endpoint
}

output "oidc_provider_arn" {
  value = module.cluster.oidc_provider_arn
}

output "config-map-aws-auth" {
  value = module.nodeg.config-map-aws-auth
}

output "kubeconfig" {
  value = module.nodeg.kubeconfig
}

output "ng1-name" {
  value = module.nodeg.ng1-name
}

output "endpoint-node" {
  value = module.nodeg.endpoint-node
}

output "ca-node" {
  value = module.nodeg.ca-node
}

output "identity-oidc-issuer-node" {
  value = module.nodeg.identity-oidc-issuer-node
}

output "cluster-name-node" {
  value = module.nodeg.cluster-name-node
}

#################### rds ######################

output "enhanced_monitoring_iam_role_name" {
  description = "The name of the monitoring role"
  value       = module.db_instance.enhanced_monitoring_iam_role_name
}

output "enhanced_monitoring_iam_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the monitoring role"
  value       = module.db_instance.enhanced_monitoring_iam_role_arn
}

output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.db_instance.db_instance_address
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.db_instance.db_instance_arn
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = module.db_instance.db_instance_availability_zone
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.db_instance.db_instance_endpoint
}

output "db_instance_engine" {
  description = "The database engine"
  value       = module.db_instance.db_instance_engine
}

output "db_instance_engine_version_actual" {
  description = "The running version of the database"
  value       = module.db_instance.db_instance_engine_version_actual
}

output "db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = module.db_instance.db_instance_hosted_zone_id
}

output "db_instance_id" {
  description = "The RDS instance ID"
  value       = module.db_instance.db_instance_id
}

output "db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = module.db_instance.db_instance_resource_id
}

output "db_instance_status" {
  description = "The RDS instance status"
  value       = module.db_instance.db_instance_status
}

output "db_instance_name" {
  description = "The database name"
  value       = module.db_instance.db_instance_name
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = module.db_instance.db_instance_username
  sensitive   = true
}

output "db_instance_domain" {
  description = "The ID of the Directory Service Active Directory domain the instance is joined to"
  value       = module.db_instance.db_instance_domain
}

output "db_instance_domain_iam_role_name" {
  description = "The name of the IAM role to be used when making API calls to the Directory Service. "
  value       = module.db_instance.db_instance_domain_iam_role_name
}

output "db_instance_port" {
  description = "The database port"
  value       = module.db_instance.db_instance_port
}

output "db_instance_ca_cert_identifier" {
  description = "Specifies the identifier of the CA certificate for the DB instance"
  value       = module.db_instance.db_instance_ca_cert_identifier
}

output "db_subnet_group_id" {
  description = "The db subnet group name"
  value       = module.db_subnet_group.db_subnet_group_id
}

output "db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = module.db_subnet_group.db_subnet_group_arn
}

output "db_parameter_group_id" {
  description = "The db parameter group id"
  value       = module.db_parameter_group.db_parameter_group_id
}

output "db_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = module.db_parameter_group.db_parameter_group_arn
}

# DB option group
output "db_option_group_id" {
  description = "The db option group id"
  value       = module.db_option_group.db_option_group_id
}

output "db_option_group_arn" {
  description = "The ARN of the db option group"
  value       = module.db_option_group.db_option_group_arn
}

################################################################################
# CloudWatch Log Group
################################################################################

output "db_instance_cloudwatch_log_groups" {
  description = "Map of CloudWatch log groups created and their attributes"
  value       = module.db_instance.db_instance_cloudwatch_log_groups
}

