/* App servers */
resource "aws_instance" "app" {
  count = 2
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.private.id}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
  key_name = "${aws_key_pair.deployer.key_name}"
  user_data = "${file(\"cloud-config/docker-swarm-worker.yml\")}"
  depends_on = ["aws_instance.swarm_master"]
  tags = { 
    Name = "docker-app-${count.index}"
  }
}

/* Docker Swarm Master */

resource "aws_instance" "swarm_master" {
  count = 1
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  private_ip = "${var.docker_swarm_master_ip}"
  subnet_id = "${aws_subnet.private.id}"
  vpc_security_group_ids = ["${aws_security_group.default.id}", "${aws_security_group.web.id}"]
  key_name = "${aws_key_pair.deployer.key_name}"
  user_data = "${file(\"cloud-config/docker-swarm-master.yml\")}"
  tags {
     Name = "Swarm Master"
  }
}

resource "aws_elb" "swarm_master" {
  name = "elb-swarm"
  subnets = ["${aws_subnet.public.id}"]
  security_groups = ["${aws_security_group.default.id}", "${aws_security_group.web.id}"]
  listener {
    instance_port = 8080
    instance_protocol = "http"
    lb_port = 8080
    lb_protocol = "http"
  }
  instances = ["${aws_instance.swarm_master.*.id}"]
}

/* Load balancer */
resource "aws_elb" "app" {
  name = "elb"
  subnets = ["${aws_subnet.public.id}"]
  security_groups = ["${aws_security_group.default.id}", "${aws_security_group.web.id}"]
  listener {
    instance_port = 30000
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 10
    unhealthy_threshold = 2
    timeout = 5
    target = "TCP:30000"
    interval = 30
  }
  instances = ["${aws_instance.app.*.id}", "${aws_instance.swarm_master.*.id}"]
}
