variable "environment" {
  type = string
}

variable "profile" {
  description = "The name of the AWS profile in the credentials file"
  type        = string
  default     = "default"
}

variable "aws_region" {
  type = string
}

variable "eks_version" {
  type    = string
  default = "1.22"
}

variable "cluster-name" {
  description = "The name of the EKS Cluster"
  type        = string
  default     = "igcbcluster01"
}

############ RDS ##############

variable "identifier" {
  description = "The name of the RDS instance"
  type        = string
  default     = "igcbpoc"
}

variable "name" {
  description = "The name of the DB parameter & option group"
  type        = string
  default     = "igcbpoc"
}

variable "engine" {
  description = "The database engine to use"
  type        = string
  default     = "oracle-ee"
}

variable "engine_name" {
  description = "The database engine to use"
  type        = string
  default     = "oracle-ee"
}

variable "major_engine_version" {
  description = "Specifies the major version of the engine that this option group should be associated with"
  type        = string
  default     = "19"
}

variable "family" {
  description = "The family of the DB parameter group"
  type        = string
  default     = "oracle-ee-19"
}
