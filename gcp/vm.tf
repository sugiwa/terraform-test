# Compute Engine
resource "google_compute_instance" "terraform_instance" {
  name = "terraform-instance"
  # machine_type = "e2-micro"
  machine_type              = "e2-medium"
  allow_stopping_for_update = true
  zone                      = var.zone
  tags                      = ["ssh", "web"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.public_subnet_1a.id

    access_config {
      # Include this section to give the VM an external IP address
    }
  }

  metadata = {
    "ssh-keys" = "${var.username}:${tls_private_key.ssh_key.public_key_openssh}"
  }
}
