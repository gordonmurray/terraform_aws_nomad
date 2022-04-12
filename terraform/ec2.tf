# Get the nomad AMI created by Packer
data "aws_ami" "nomad" {
  most_recent = true

  filter {
    name   = "name"
    values = ["nomad"]
  }

  owners = [var.aws_ami_account_id]
}

# Create nomad instance(s)
resource "aws_instance" "nomad" {
  ami                     = data.aws_ami.nomad.id
  key_name                = aws_key_pair.pem-key.key_name
  subnet_id               = var.vpc_subnets[count.index]
  vpc_security_group_ids  = [aws_security_group.nomad.id]
  disable_api_termination = false
  instance_type           = var.instance_type
  count                   = 1

  root_block_device {
    delete_on_termination = true
    encrypted             = true
    volume_size           = "50"

    tags = {
      Name = "nomad ${count.index}"
    }
  }

  metadata_options {
    http_tokens   = "required"
    http_endpoint = "enabled"
  }

  tags = {
    Name = "nomad ${count.index}"
  }

}
