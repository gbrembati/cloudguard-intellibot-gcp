variable "gcp-project" {
  type = string
  sensitive = true
  description = "used to define the project name"
} # Value set via Variable-Set in Terraform Cloud

variable "gcp-region" {
  type = string
  sensitive = false
  description = "used to define the region"
} # Value set via Variable-Set in Terraform Cloud

variable "gcp-credentials" {
  type = string
  sensitive = true
  description = "used to define the json key content"
} # Value set via Variable-Set in Terraform Cloud

variable "project-concept" {
  type = string
  default = "intellibot"
  description = "variable used to name resources"
}