#Create the inbound security groups

resource "aws_security_group" "internal" {
  count  = "${var.internal_lb}"
  name   = "tf-alb-sg-${var.name}-internal"
  vpc_id = "${var.vpc_id}"
}

resource "aws_lb" "internal_alb" {
  count           = "${var.internal_lb}"
  name            = "${var.name}-internal"
  internal        = "${var.internal_lb}"
  security_groups = ["${aws_security_group.internal.id}"]
  subnets         = ["${var.private_subnets}"]
}

resource "aws_security_group_rule" "internal_egress" {
  count             = "${var.internal_lb}"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.internal.id}"
}

resource "aws_security_group" "external" {
  count  = "${var.external_lb}"
  name   = "tf-alb-sg-${var.name}-external"
  vpc_id = "${var.vpc_id}"
}

resource "aws_security_group_rule" "external_egress" {
  count             = "${var.external_lb}"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.external.id}"
}

resource "aws_lb" "external_alb" {
  count           = "${var.external_lb}"
  name            = "${var.name}-external"
  internal        = "${var.external_lb}"
  security_groups = ["${aws_security_group.external.id}"]
  subnets         = ["${var.public_subnets}"]
}
