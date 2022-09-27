

resource "google_compute_network" "vpc-intellibot" {
  count     = lenth(var.network-definition)  
  name      = "vpc-${var.project-concept}-${lookup(var.var.network-definition,count.index)[0]}"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "nets-intellibot-A" {
  count     = lenth(var.network-definition)
  region    = var.gcp-region
  network   = google_compute_network.vpc-intellibot[count.index].name
  ip_cidr_range = lookup(var.var.network-definition,count.index)[1]
  name      = "net-${var.project-concept}-${lookup(var.var.network-definition,count.index)[0]}-A"  
}
resource "google_compute_subnetwork" "nets-intellibot-B" {
  count     = lenth(var.network-definition)
  region    = var.gcp-region
  network   = google_compute_network.vpc-intellibot[count.index].name
  ip_cidr_range = lookup(var.var.network-definition,count.index)[2]
  name      = "net-${var.project-concept}-${lookup(var.var.network-definition,count.index)[0]}-B"  
}
/*
module "vpc-intellibot-A" {
  source  = "terraform-google-modules/network/google//modules/vpc"
  version = "~> 2.0.0"

  project_id   = var.gcp-project
  network_name = "vpc-${var.project-concept}-A"
}
module "nets-intellibot-A" {
  source  = "terraform-google-modules/network/google//modules/subnets"
  version = "~> 2.0.0"

  project_id   = var.gcp-project
  network_name = "vpc-${var.project-concept}-A"

  subnets = [
    {
      subnet_name           = "net-${var.project-concept}-A-01"
      subnet_ip             = "10.10.10.0/24"
      subnet_region         = var.gcp-region
    },
    {
      subnet_name           = "net-${var.project-concept}-A-02"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = var.gcp-region
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
      subnet_flow_logs_interval    = "INTERVAL_10_MIN"
    }
  ]
}

module "vpc-intellibot-B" {
  source  = "terraform-google-modules/network/google//modules/vpc"
  version = "~> 2.0.0"

  project_id   = var.gcp-project
  network_name = "vpc-${var.project-concept}-B"

}
module "nets-intellibot-B" {
  source  = "terraform-google-modules/network/google//modules/subnets"
  version = "~> 2.0.0"

  project_id   = var.gcp-project
  network_name = "vpc-${var.project-concept}-B"

  subnets = [
    {
      subnet_name           = "net-${var.project-concept}-B-01"
      subnet_ip             = "10.20.10.0/24"
      subnet_region         = var.gcp-region
    },
    {
      subnet_name           = "net-${var.project-concept}-B-02"
      subnet_ip             = "10.20.20.0/24"
      subnet_region         = var.gcp-region
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
      subnet_flow_logs_interval    = "INTERVAL_10_MIN"
    }
  ]
}
*/