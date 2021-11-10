output "vpc_id" {
  value = data.aws_vpc.selected.id
}

output "server_ip" {
  value = data.aws_instance.public_ip
}
