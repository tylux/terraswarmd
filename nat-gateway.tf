/* NAT Gateway */

resource "aws_eip" "nat" {
  vpc      = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id = "${aws_subnet.bastion.id}"
  depends_on = ["aws_internet_gateway.default"]

}
