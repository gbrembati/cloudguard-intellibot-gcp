
resource "google_compute_network" "vpc-intellibot" {
  count     = length(var.network-definition)  
  name      = "vpc-${var.project-concept}-${lookup(var.network-definition,count.index)[0]}"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "nets-intellibot-A" {
  count     = length(var.network-definition)
  region    = var.gcp-region
  private_ip_google_access = true
  network   = google_compute_network.vpc-intellibot[count.index].name
  ip_cidr_range = lookup(var.network-definition,count.index)[1]
  name      = "net-${var.project-concept}-${lookup(var.network-definition,count.index)[0]}-A"  
}
resource "google_compute_subnetwork" "nets-intellibot-B" {
  count     = length(var.network-definition)
  region    = var.gcp-region
  private_ip_google_access = true
  network   = google_compute_network.vpc-intellibot[count.index].name
  ip_cidr_range = lookup(var.network-definition,count.index)[2]
  name      = "net-${var.project-concept}-${lookup(var.network-definition,count.index)[0]}-B"  
}
resource "google_compute_subnetwork" "nets-intellibot-C" {
  count     = length(var.network-definition)
  region    = var.gcp-region
  private_ip_google_access = true
  network   = google_compute_network.vpc-intellibot[count.index].name
  ip_cidr_range = lookup(var.network-definition,count.index)[3]
  name      = "net-${var.project-concept}-${lookup(var.network-definition,count.index)[0]}-B"  
}