output "app.0.ip" {
  value = "${aws_instance.app.0.private_ip}"
}

output "app.1.ip" {
  value = "${aws_instance.app.1.private_ip}"
}

output "app.2.ip" {
  value = "${aws_instance.app.1.private_ip}"
}
output "app.3.ip" {
  value = "${aws_instance.app.1.private_ip}"
}

output "swarm.master.ip" {
  value = "${aws_instance.swarm_master.private_ip}"
}

output "nat.ip" {
  value = "${aws_nat_gateway.nat.public_ip}"
}

output "elb.hostname" {
  value = "${aws_elb.app.dns_name}"
}

output "swarm.elb.hostname" {
  value = "${aws_elb.swarm_master.dns_name}"
}

