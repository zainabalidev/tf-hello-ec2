output "latest_amazon_linux_ami_id" {
  value = data.aws_ami.latest_amazon_linux.id
}

output "server_1_public_dns" {
  value = aws_instance.server[0].public_dns
}

output "server_2_public_dns" {
  value = aws_instance.server[1].public_dns
}

output "server_1_public_dns" {
  value = aws_instance.server[2].public_dns
}