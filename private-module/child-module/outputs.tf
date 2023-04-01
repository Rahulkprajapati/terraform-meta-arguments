output "vpc-name" {
  value = google_compute_network.cloudclan-vpc.name

}

output "vpc-id" {
  value = google_compute_network.cloudclan-vpc.id

}

output "subnetwork-name" {
  value = google_compute_subnetwork.cloudclan-subnetwork.name

}

output "vm-name" {
  value = google_compute_instance.cloudclan-vm.name

}
