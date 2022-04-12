output "instance_ip_addresses" {
  value       = aws_instance.nomad[*].public_dns
  description = "Public DNS names for SSH access"
}
