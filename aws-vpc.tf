/* Setup our aws provider */
provider "aws" {
  region      = "${var.region}"
}

/* Define our vpc */
resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags { 
    Name = "super-cool-app" 
  }
}
