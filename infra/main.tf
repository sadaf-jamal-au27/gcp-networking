resource "google_compute_network" "vpc" {
  name                    = sadaf-vpc
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "public" {
  name          = "public-subnet01"
  region        = var.region
  network       = google_compute_network.vpc.id
  ip_cidr_range = var.public_subnet_cidr
}

resource "google_compute_subnetwork" "private" {
  name          = "private-subnet01"
  region        = var.region
  network       = google_compute_network.vpc.id
  ip_cidr_range = var.private_subnet_cidr

  # Not required for Project-1, but harmless and useful later (Cloud NAT / private API access labs).
  private_ip_google_access = true
}

resource "google_compute_firewall" "allow_ssh_to_public_from_my_ip" {
  name    = "allow-ssh-to-public-from-my-ip"
  network = google_compute_network.vpc.name

  direction     = "INGRESS"
  source_ranges = [var.my_ip_cidr]
  target_tags   = ["public-ssh"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "allow_ssh_from_public_to_private" {
  name    = "allow-ssh-from-public-to-private"
  network = google_compute_network.vpc.name

  direction   = "INGRESS"
  source_tags = ["public-ssh"]
  target_tags = ["private-ssh"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_instance" "vm_public" {
  name         = "vm-public"
  machine_type = "e2-micro"
  zone         = var.zone
  tags         = ["public-ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network    = google_compute_network.vpc.id
    subnetwork = google_compute_subnetwork.public.id

    # External IP enabled
    access_config {}
  }
}

resource "google_compute_instance" "vm_private" {
  name         = "vm-private01"
  machine_type = "e2-micro"
  zone         = var.zone
  tags         = ["private-ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network    = google_compute_network.vpc.id
    subnetwork = google_compute_subnetwork.private.id
    # No access_config => no external IP
  }
}

