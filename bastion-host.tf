/* Bastion server */
resource "aws_eip" "bastion" {
  instance = "${aws_instance.bastion.id}"
  vpc      = true
}

resource "aws_instance" "bastion" {
  count = 1
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.bastion.id}"
  vpc_security_group_ids = ["${aws_security_group.default.id}", "${aws_security_group.bastion-inbound.id}"]
  key_name = "${aws_key_pair.deployer.key_name}"
  source_dest_check = false
  tags {
     Name = "Bastion"
  }
}

