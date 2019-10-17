provider "aws" {
  region = "us-east-2"
}

module "my_vpc"{
	source     = "../modules/vpc"
	vpc_cidr   = "192.168.0.0/16"
	vpc_id	   = "${module.my_vpc.vpc_id}"
	subnet_cidr= "192.168.1.0/24"

}

module "my_ec2"{
	source 	   = "../modules/ec2"
	ec2_count  = 1
	ami_id     = "ami-0c64dd618a49aeee8"
	subnet_id  = "${module.my_vpc.subnet_id}"
}
