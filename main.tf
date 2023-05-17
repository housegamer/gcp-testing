terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.65.2" # What version are we using, latest ? 
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = var.credentials
}

resource "google_service_account" "sa_default" {
  account_id   = var.sa_account_id
  display_name = var.sa_display_name
}

resource "google_compute_instance" "vm_instance" {
  name                      = var.vm_name
  machine_type              = var.machine_type
  zone                      = var.zone
  allow_stopping_for_update = true

  tags = ["env", "testing"]

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
    }
  }

  network_interface {
    network = "default"
  }

  service_account {
    scopes = ["cloud-platform"]
    email  = google_service_account.sa_default.email
  }
}
