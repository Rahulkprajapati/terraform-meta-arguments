module "vpc" {
    #you need to define from where you are calling "source"
    source  = "terraform-google-modules/network/google"
    version = "~> 6.0"

    project_id   = "<project id"
    network_name = "airasia-custom-vpc"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-west1"
        },
    ]

    secondary_ranges = {
        subnet-01 = [
            {
                range_name    = "subnet-01-secondary-01"
                ip_cidr_range = "192.168.64.0/24"
            },
        ]

        subnet-02 = []
    }
}