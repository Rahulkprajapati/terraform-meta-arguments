module "prod-infra" {
    source = "../child-module"
    vpc-name = "cloudclan-vpc-prod"
    subnetwork-name = "cloudclan-subnet-prod"
    vm-name = "cloudclan-vm-prod"
    ip_cidr_range = "10.20.0.0/16"
}

#This will call the module present in the directory ../child-module
