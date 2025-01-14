# Module Configuration Variables
region  = "eu-west-2"
owner   = "lancehaig"
created-by = "Terraform CLI"
public_key = ""
clusterid = "guy-nomad"
host_access_ip = []
server_number = "3"
server_instance_type = "t2.medium"
worker_number = "3"
worker_instance_type = "t2.medium"
datacenter = "dc1"
# General Variables
nomad_url = "https://releases.hashicorp.com/nomad/0.10.2-rc1/nomad_0.10.2-rc1_linux_amd64.zip"
vpc_cidr_block = "10.1.0.0/16"
cidr_blocks = ["10.1.1.0/24", "10.1.2.0/24"]
nomad_join = "nomad_join"
