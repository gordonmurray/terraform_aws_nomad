resource "aws_security_group" "nomad" {
  name        = "Nomad"
  description = "Nomad security group"
  vpc_id      = var.vpc_id

  tags = {
    Name = "Nomad"
  }
}

resource "aws_security_group_rule" "nomad_egress_1" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nomad.id
  description       = "Allow all out"
}

resource "aws_security_group_rule" "nomad_ingress_1" {
  type                     = "ingress"
  from_port                = 4646
  to_port                  = 4646
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.nomad.id
  security_group_id        = aws_security_group.nomad.id
  description              = "Nomad port"
}

resource "aws_security_group_rule" "nomad_ingress_2" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.nomad.id
  description       = "SSH access to debug"
  cidr_blocks       = ["${var.my_ip_address}/32"]
}
