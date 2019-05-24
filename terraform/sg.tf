resource "aws_security_group" "nomad_sg" {
  name        = "Nomad sg"
  description = "Nomad security group"
}


resource "aws_security_group_rule" "nomad_sg_1" {

  type                     = "ingress"
  from_port                = 4646
  to_port                  = 4646
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.nomad_sg.id}"
  security_group_id        = "${aws_security_group.nomad_sg.id}"
  description              = ""
  cidr_blocks              = ["0.0.0.0/0"]

}

resource "aws_security_group_rule" "nomad_sg_2" {

  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.nomad_sg.id}"
  security_group_id        = "${aws_security_group.nomad_sg.id}"
  description              = ""
  cidr_blocks              = ["0.0.0.0/0"]

}