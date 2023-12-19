# Compute Engine
resource "google_compute_instance" "terraform_instance" {
  name         = "terraform-instance"
  machine_type = "e2-micro"
  zone         = var.zone
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public_subnet_1a.id

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}
