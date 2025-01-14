
resource "aws_security_group" "nomad_sg" {
  name_prefix = var.clusterid
  vpc_id      = aws_vpc.nomad_vpc.id

  # SSH access if host_access_ip has CIDR blocks
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.host_access_ip]
  }

#HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

#Nomad HTTPS
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

#Nomad
  ingress {
    from_port   = 3000
    to_port     = 5199
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

#Consul
  ingress {
    from_port   = 8000
    to_port     = 10000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


#More nomad ports
  ingress {
    from_port   = 20000
    to_port     = 29999
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 30000
    to_port     = 39999
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9990
    to_port     = 9999
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name           = "${var.clusterid}-${random_id.nomad_cluster.hex}"
    owner          = var.owner
    created-by     = var.created-by
    nomad_join     = var.nomad_join
  }
}
