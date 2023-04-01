variable "vm-name" {
  default = ["dev-vm", "prod-vm"]
  type    = list(string)
}

variable "vpc-name" {
  default = "cloud-vpc"
}

variable "subnetwork-name" {
  default = "cloud-subnetwork"
}
