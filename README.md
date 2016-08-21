# Terraswarmd

Terraswarmd (Terraform, Docker 1.12 (swarm)) is an exercise in bringing up an AWS environment and deploying Docker Swarm to it with as little human intervention as possible.

What this allows you to do is have a fully functioning Docker Swarm cluster in ec2, and by changing the number of app-servers add worker nodes that automatically install Docker, join the swarm, and register them to the Elastic Load Balancer.

Included circle.yml file for deploying with CircleCI. Thanks to https://twitter.com/undeadops for this.

### Instructions: 

1. Create an account with enough privileges in AWS, use AWS access_key and secret_key for authentication. If running from local machine, installed and configured AWS cli tools will be enough to authenticate Terraform.

2. Requires manual setup of Swarm Master Node, see https://docs.docker.com/engine/swarm/swarm-tutorial/create-swarm/

3. cp cloud-config/docker-swarm-worker-example.yml  cloud-config/docker-swarm-worker.yml and modify with your Swarm Node Master IP and Token

4. Create ssh/ directory inside cloned repo and symlink or create a ssh pub key inside there, then modify key-pairs.tf.

### To-do

1. Setup https://github.com/ManoMarks/docker-swarm-visualizer to start up automatically on the Swarm Master.

2. Make use of Terraforms templating capabilities.
