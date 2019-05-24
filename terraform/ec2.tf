data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["nomad*"]
  }

  owners = ["${var.owner_id}"]

}

resource "aws_instance" "web" {
  ami                    = "${data.aws_ami.ubuntu.id}"
  instance_type          = "m5.large"
  key_name               = "gordonmurray"
  vpc_security_group_ids = ["${aws_security_group.nomad_sg.id}"]

  tags = {
    Name = "Nomad"
  }

}