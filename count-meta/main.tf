//==============================GOOGLE COMPUTE VPC CREATION=========================
resource "google_compute_network" "cloudclan-vpc" {
  name                    = var.vpc-name
  auto_create_subnetworks = false
}

//==============================GOOGLE COMPUTE SUBNETWORK CREATION=========================
resource "google_compute_subnetwork" "cloudclan-subnetwork" {
  name          = var.subnetwork-name
  ip_cidr_range = "10.26.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.cloudclan-vpc.id
  secondary_ip_range = [{
    range_name    = "pod-ranges"
    ip_cidr_range = "10.21.0.0/16"
    },
    {
      range_name    = "service-ranges"
      ip_cidr_range = "10.22.0.0/16"
    }
  ]
  depends_on = [
    google_compute_network.cloudclan-vpc
  ]
}

//==============================GOOGLE COMPUTE ENGINE CREATION=========================
resource "google_compute_instance" "cloudclan-vm" {
  #HERE YOU NEED TO UPDATE AFTER VARIABLE [count.index]
  name         = var.vm-name[count.index]
  count        = length(var.vm-name)
  #length function to know number of items present in variable "vm-name"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["foo", "bar", "bastion"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        owner = "cloudclan"
      }
    }
  }

  network_interface {
    network    = google_compute_network.cloudclan-vpc.id
    subnetwork = google_compute_subnetwork.cloudclan-subnetwork.id

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  ##META AGRUMENTS
  depends_on = [
    google_compute_subnetwork.cloudclan-subnetwork
  ]

  # ##LIFECYCLE RULES
  # lifecycle {
  #   create_before_destroy = true
  # }
}

