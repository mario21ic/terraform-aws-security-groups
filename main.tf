resource "aws_security_group" "my_sg" {
  name        = "${var.env}-sg-${var.name}"
  description = "${var.name} inbound and outbound"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name        = "${var.env}-sg-${var.name}"
    Env         = "${var.env}"
    Description = "${var.name} security group ${var.env}"
  }
}

resource "aws_security_group_rule" "ingress_sgs" {
  security_group_id = "${aws_security_group.my_sg.id}"
  count             = "${var.ingress_sgs_qty}"
  type              = "ingress"

  from_port         = "${lookup(var.ingress_sgs_rules[count.index], "from_port")}"
  to_port           = "${lookup(var.ingress_sgs_rules[count.index], "to_port")}"
  protocol          = "${lookup(var.ingress_sgs_rules[count.index], "protocol")}"
  source_security_group_id = "${lookup(var.ingress_sgs_rules[count.index], "security_group_id")}"
}

resource "aws_security_group_rule" "ingress_self" {
  security_group_id = "${aws_security_group.my_sg.id}"
  count             = "${length(var.ingress_self_rules)}"
  type              = "ingress"

  self              = true
  from_port         = "${lookup(var.ingress_self_rules[count.index], "from_port")}"
  to_port           = "${lookup(var.ingress_self_rules[count.index], "to_port")}"
  protocol          = "${lookup(var.ingress_self_rules[count.index], "protocol")}"
}

resource "aws_security_group_rule" "ingress_ips" {
  security_group_id = "${aws_security_group.my_sg.id}"
  count             = "${length(var.ingress_ips_rules)}"
  type              = "ingress"

  from_port         = "${lookup(var.ingress_ips_rules[count.index], "from_port")}"
  to_port           = "${lookup(var.ingress_ips_rules[count.index], "to_port")}"
  protocol          = "${lookup(var.ingress_ips_rules[count.index], "protocol")}"
  cidr_blocks       = ["${lookup(var.ingress_ips_rules[count.index], "cidr_block")}"]
}

resource "aws_security_group_rule" "egress_sgs" {
  security_group_id = "${aws_security_group.my_sg.id}"
  count             = "${var.egress_sgs_qty}"
  type              = "egress"

  from_port         = "${lookup(var.egress_sgs_rules[count.index], "from_port")}"
  to_port           = "${lookup(var.egress_sgs_rules[count.index], "to_port")}"
  protocol          = "${lookup(var.egress_sgs_rules[count.index], "protocol")}"
  source_security_group_id = "${lookup(var.egress_sgs_rules[count.index], "security_group_id")}"
}

resource "aws_security_group_rule" "egress_self" {
  security_group_id = "${aws_security_group.my_sg.id}"
  count             = "${length(var.egress_self_rules)}"
  type              = "egress"

  self              = true
  from_port         = "${lookup(var.egress_self_rules[count.index], "from_port")}"
  to_port           = "${lookup(var.egress_self_rules[count.index], "to_port")}"
  protocol          = "${lookup(var.egress_self_rules[count.index], "protocol")}"
}

resource "aws_security_group_rule" "egress_ips" {
  security_group_id = "${aws_security_group.my_sg.id}"
  count             = "${length(var.egress_ips_rules)}"
  type              = "egress"

  from_port         = "${lookup(var.egress_ips_rules[count.index], "from_port")}"
  to_port           = "${lookup(var.egress_ips_rules[count.index], "to_port")}"
  protocol          = "${lookup(var.egress_ips_rules[count.index], "protocol")}"
  cidr_blocks       = ["${lookup(var.egress_ips_rules[count.index], "cidr_block")}"]
}