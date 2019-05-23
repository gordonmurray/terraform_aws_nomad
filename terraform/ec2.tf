data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["nomad*"]
  }

  owners = ["016230046494"]

}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "m5.large"
  key_name      = "gordonmurray"

  tags = {
    Name = "Nomad"
  }

}