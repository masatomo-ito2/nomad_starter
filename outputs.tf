output "vpc_id" {
  value = data.aws_vpc.selected.id
}

output "server_ip" {
  value = data.aws_instance.server.public_ip
}

output "nomad_dns" {
  value = "https://${data.aws_istance.public_dns}:4646"
}
