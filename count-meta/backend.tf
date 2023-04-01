terraform {
  backend "gcs" {
    bucket = "<YOUR GCS BUCKET NAME>"
    prefix = "terraform/state/new"
  }
}
