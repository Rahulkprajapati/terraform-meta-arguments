module "prod-infra" {
    source = "../child-module"
    vpc-name = "airasia-vpc-prod"
    subnetwork-name = "airasia-subnet-prod"
    vm-name = "airasia-vm-prod"
    ip_cidr_range = "10.20.0.0/16"
}

#This will call the module present in the directory ../child-module