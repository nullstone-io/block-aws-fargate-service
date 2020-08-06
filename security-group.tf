resource "aws_security_group" "this" {
  name = "${var.nullstone.stack}-${var.nullstone.env}-${var.nullstone.block}"

  tags = {
    Stack       = var.nullstone.stack
    Environment = var.nullstone.env
    Block       = var.nullstone.block
  }
}

resource "aws_security_group_rule" "this-https-to-world" {
  security_group_id = aws_security_group.this.id
  type              = "egress"
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443
  cidr_blocks       = ["0.0.0.0/0"]
}
