// Main VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr # IP range for the VPC
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = {
    Name = "${var.vpc_name}-VPC"
  }
}
# ===== SUBNET PART =====
// Public Subnets
resource "aws_subnet" "public" {
  count = length(var.public_subnets_cidr)
  vpc_id = aws_vpc.main_vpc.id # Link to VPC
  cidr_block = element(var.public_subnets_cidr, count.index) # IP range for the subnet by list
  availability_zone = element(var.availability_zones, count.index % length(var.availability_zones)) #
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public-subnet-${count.index + 1}"
  }
}

// Private Subnets
resource "aws_subnet" "private" {
  count = length(var.private_subnets_cidr)
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = element(var.private_subnets_cidr, count.index)
  availability_zone = element(var.availability_zones, count.index % length(var.availability_zones))

  tags = {
    Name = "${var.vpc_name}-private-subnet-${count.index + 1}"
  }
}

# ===== END SUBNET PART =====

# ==== GATEWAY PART ====

// Internet Gateway
resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.vpc_name}-IGW"
  }
}

// Nat Gateway
module "nat" {
  source               = "../nat"
  enable_nat_gateway   = var.enable_nat_gateway
  public_subnet_id = aws_subnet.public[0].id  # Use the first subnet created
  availability_zones = element(var.availability_zones, count.index % length(var.availability_zones))
  private_subnets_cidr = var.private_subnets_cidr
  public_subnets_cidr  = var.public_subnets_cidr
}

// Route Table
module "route_tables" {
}