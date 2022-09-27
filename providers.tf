terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 4.38.0"
    }
  }
}

provider "google" {
  project     = var.gcp-project
  region      = var.gcp-region
  credentials = var.gcp-credentials
}
