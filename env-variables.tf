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

variable "network-definition" {
  description = "variable used to define network resources"
  default = {
    0 = ["dev","10.10.0.0/24","10.10.1.0/24","10.10.2.0/24"]
    2 = ["preprod","10.20.0.0/24","10.20.1.0/24","10.20.2.0/24"]
    1 = ["prod","10.30.0.0/24","10.30.1.0/24","10.30.2.0/24"]
  }
}