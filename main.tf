provider "aws" {
  region = "ap-northeast-1"
}

data "aws_vpc" "selected" {
  tags = {
    Name = var.vpc_name
  }
}

module "nomad-starter" {
  source  = "hashicorp/nomad-starter/aws"
  version = "0.2.1"
  # insert the 6 required variables here
  allowed_inbound_cidrs = ["0.0.0.0/0"]
  vpc_id                = data.aws_vpc.selected.id
  consul_version        = var.consul_version
  nomad_version         = var.nomad_version
  owner                 = var.owner
  name_prefix           = var.prefix
  key_name              = var.key_name
  nomad_servers         = 1
  nomad_clients         = 2

  # Optional
  enable_connect = true
  public_ip      = true
  instance_type  = var.instance_type
}

data "aws_instance" "server" {
  instance_tags = {
    Name = "${var.prefix}-nomad-server"
  }

  depends_on = [module.nomad-starter]
}

data "aws_instances" "clients" {
  filter {
    Name = "${var.prefix}-nomad-client"
  }
}

