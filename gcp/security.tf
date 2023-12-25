resource "google_compute_firewall" "ssh" {
  name = "allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }

  direction     = "INGRESS"
  network       = google_compute_network.vpc_network.id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}
resource "google_compute_firewall" "hhtp" {
  name = "allow-http"
  allow {
    ports    = ["80", "443"]
    protocol = "tcp"
  }

  direction     = "INGRESS"
  network       = google_compute_network.vpc_network.id
  priority      = 1000
  source_ranges = ["${chomp(data.http.ipv4_icanhazip.response_body)}/32"]
  target_tags   = ["web"]
}

data "http" "ipv4_icanhazip" {
  url = "https://ipv4.icanhazip.com/"
}