output "vpc_id" {
  value = data.aws_vpc.selected.id
}

output "server_ip" {
  value = data.aws_instance.server.public_ip
}

output "client_ip" {
	value = data.aws_instances.client.public_ips
}

output "nomad_dns" {
  value = "http://${data.aws_instance.server.public_dns}:4646"
}

output "consul_dns" {
  value = "http://${data.aws_instance.server.public_dns}:8500"
}

