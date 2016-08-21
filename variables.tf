
variable "region"     { 
  description = "AWS region to host your network"
  default     = "us-west-1" 
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.128.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  default     = "10.128.0.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for private subnet"
  default     = "10.128.1.0/24"
}

variable "private_bastion_subnet_cidr" {
  description = "CIDR for bastion private subnet"
  default     = "10.128.2.0/24"
}

variable "docker_swarm_master_ip" {
  description = "Docker Swarm Masters IP Address"
  default     = "10.128.1.100"
}

/* Ubuntu 14.04 amis by region */
variable "amis" {
  description = "Base AMI to launch the instances with"
  default = {
    us-west-1 = "ami-48db9d28" 
    us-east-1 = "ami-a6b8e7ce"
  }
}

