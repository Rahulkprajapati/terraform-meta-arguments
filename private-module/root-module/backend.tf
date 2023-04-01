terraform {
  backend "gcs" {
    bucket = "cloudclan-tf-state-backend"
    prefix = "terraform/state/module"
  }
}
