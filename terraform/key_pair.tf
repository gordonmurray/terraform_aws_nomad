resource "aws_key_pair" "pem-key" {
  key_name   = "nomad"
  public_key = file("~/.ssh/id_rsa.pub")
}