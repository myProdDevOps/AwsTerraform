# Elastic IP (Public IP) for NAT Gateway
resource "aws_eip" "nat_eip" {
  count = var.enable_nat_gateway ? 1 : 0

  tags = {
    Name = "${var.vpc_name}-nat-eip"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  count         = var.enable_nat_gateway ? 1 : 0
  allocation_id = aws_eip.nat_eip[0].id
  subnet_id     = var.public_subnet_id # Assign value from the module input later

  tags = {
    Name = "${var.vpc_name}-nat-gateway"
  }
}