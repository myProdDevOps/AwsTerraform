output "public_ips" {
  value = aws_eip.vpc_eip[*].public_ip
}

output "dns_names" {
  value = aws_eip.vpc_eip[*].public_dns
}
