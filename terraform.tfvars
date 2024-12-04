aws_region      = "us-east-1"
aws_profile     = "default"
aws_environment = "stag"
aws_project     = "wp-app"
aws_owner       = "devops-team"

aws_vpc_config = {
  cidr_block                   = "10.0.0.0/16"
  enable_dns_support           = true
  enable_dns_hostnames         = true
  public_subnets_cidr          = ["10.0.2.0/24"]
  private_subnets_cidr         = ["10.0.3.0/24"]
  number_of_availability_zones = 1
  enable_nat_gateway           = true
}

aws_instance_config = {
  key_name = "ttdn-keypair"
  management_private_ips = ["10.0.2.10"]
  k8s_master_private_ips = ["10.0.3.10"]
  k8s_worker_private_ips = ["10.0.3.20"]
  management_instance_count     = 1
  k8s_master_instance_count     = 1
  k8s_worker_instance_count    = 1
  management_instance_type  = "t2.micro"
  cluster_instance_type     = "t2.micro"
}