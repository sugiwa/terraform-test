# VPC
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

# Public Subnet
resource "google_compute_subnetwork" "public_subnet_1a" {
  name          = "terraform-public-subnet-1a"
  network       = google_compute_network.vpc_network.id
  ip_cidr_range = "10.0.1.0/24"

}