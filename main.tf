#Create the inbound security groups

resource "aws_security_group" "internal" {
  count  = "${var.internal_lb}"
  name   = "tf-alb-sg-${var.name}-internal"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["${data.aws_vpc.selected.cidr_block}"]
  }

  egress {
    protocol    = "-1"
    cidr_blocks = ["${data.aws_vpc.selected.cidr_block}"]
  }
}

resource "aws_lb" "internal_alb" {
  count           = "${var.internal_lb}"
  name            = "${var.name}-internal"
  internal        = "${var.internal_lb}"
  security_groups = ["${aws_security_group.internal.id}"]
  subnets         = ["${var.private_subnets}"]
}

resource "aws_security_group" "external" {
  count  = "${var.external_lb}"
  name   = "tf-alb-sg-${var.name}-external"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "internal_alb" {
  count           = "${var.external_lb}"
  name            = "${var.name}-external"
  internal        = "${var.external_lb}"
  security_groups = ["${aws_security_group.external.id}"]
  subnets         = ["${var.public_subnets}"]
}
