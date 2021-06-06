provider "aws" {
	access_key = "AKIAYID6EYKQPNIWMZP2"
	secret_key = "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"
	region = "us-east-1"
}

module testenv {
  source  = "./modules/network"
vpc_cidr = "10.11.0.0/16"
vpc_name =  "testenv-vpc"
IGW_name =  "testenv-vpc-igw"
key_name =  "awsb29batches"
public_subnet1_cidr = "10.11.1.0/24"
public_subnet2_cidr = "10.11.2.0/24"
public_subnet3_cidr = "10.11.3.0/24"
public_subnet1_name = "testenv-vpc-subnet-1"
public_subnet2_name = "testenv-vpc-subnet-2"
public_subnet3_name = "testenv-vpc-subnet-3"
Main_Routing_Table  =  " testenv-vpc-main-rt"
azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
environment = "test"
}

module testenv-ec2 {
  source  = "./modules/ec2"
imagename  = "ami-0747bdcabd34c712a"
instance_type = "t2.nano"
key_name  = "awsb29batches"
subnet1 = "${module.testenv.subnet1_id}"
sg = "${module.testenv.sg_id}"

}