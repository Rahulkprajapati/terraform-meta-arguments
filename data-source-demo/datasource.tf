data "terraform_remote_state" "foo" {
  backend = "gcs"
  config = {
    bucket  = "cloudclan-tf-state-backend"
    prefix  = "terraform/state/vpc"
  }
}

#Data source has the bucket name in which the other resources has been created but u want to fetch some data to creat something in different .tfstate

#1- Above example is that you only create VPC and subnetworks and the state file only holds for vpc metadata
#2- Now requirment comes that you have to create VM(google compute instance) under particular VPC and subnetworks 
#3- So you will use VPC and subnetwork backend bucket under datasource config with proper prefix under which .tfstate file is present