// Route tables for public subnets
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  // Define a route for the Internet Gateway
  route {
    cidr_block = "0.0.0.0/0"             # Applied CIDR block
    gateway_id = var.internet_gateway_id # Internet Gateway ID - Assign later
  }

  tags = {
    Name = "${var.vpc_name}-public-route-table"
  }
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_ids) # Number of public subnets - Assign later
  subnet_id = var.public_subnet_ids[count.index] # Number of public subnets - Assign later
  route_table_id = aws_route_table.public.id
}

// Route table for private subnets
resource "aws_route_table" "private" {
  count  = var.enable_nat_gateway ? 1 : 0
  vpc_id = var.vpc_id
  // Define a route for the NAT Gateway
  route {
    cidr_block     = "0.0.0.0/0"        # Applied CIDR block
    nat_gateway_id = var.nat_gateway_id # NAT Gateway ID - Assign later
  }

  tags = {
    Name = "${var.vpc_name}-private-route-table"
  }
}

resource "aws_route_table_association" "private" {
  count          = var.enable_nat_gateway ? length(var.private_subnet_ids) : 0
  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = aws_route_table.private[0].id
}
