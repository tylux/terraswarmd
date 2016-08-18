# Terraswarmd

0. Create file terraform.tfvars with your AWS keys as the values

```bash
/* Do not check this in!! ensure it is added to .gitignore */
access_key = 
secret_key =
```


1. Requires manual setup of Swarm Master Node, see https://docs.docker.com/engine/swarm/swarm-tutorial/create-swarm/

2. cp cloud-config/docker-swarm-worker-example.yml  cloud-config/docker-swarm-worker.yml and modify with your Swarm Node Master IP and Token

## To-do
Fix up outputs.tf


Setup https://github.com/ManoMarks/docker-swarm-visualizer to start up automatically on the Swarm Master

