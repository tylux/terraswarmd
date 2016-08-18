/* Private subnet */
resource "aws_subnet" "private" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.private_subnet_cidr}"
  availability_zone = "us-west-1a"
  map_public_ip_on_launch = false
  depends_on = ["aws_nat_gateway.nat"]
  tags { 
    Name = "private" 
  }
}

/* Routing table for private subnet */
resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.default.id}"
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat.id}"
  }
}

/* Associate the routing table to public subnet */
resource "aws_route_table_association" "private" {
  subnet_id = "${aws_subnet.private.id}"
  route_table_id = "${aws_route_table.private.id}"
}



/* Bastion subnet */
resource "aws_subnet" "bastion" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.private_bastion_subnet_cidr}"
  availability_zone = "us-west-1a"
  map_public_ip_on_launch = false
  depends_on = ["aws_internet_gateway.default"]
  tags {
    Name = "private"
  }
}

/* Routing table for private subnet */
resource "aws_route_table" "bastion" {
  vpc_id = "${aws_vpc.default.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }
}

/* Associate the routing table to public subnet */
resource "aws_route_table_association" "bastion" {
  subnet_id = "${aws_subnet.bastion.id}"
  route_table_id = "${aws_route_table.bastion.id}"
}
