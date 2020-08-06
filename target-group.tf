resource "aws_lb_target_group" "this" {
  name                 = "${var.nullstone.stack}-${var.nullstone.env}-${var.nullstone.block}"
  port                 = 80
  protocol             = "HTTP"
  target_type          = "ip"
  vpc_id               = data.terraform_remote_state.network.outputs.vpc_id
  deregistration_delay = 30

  tags = {
    Stack       = var.nullstone.stack
    Environment = var.nullstone.env
    Block       = var.nullstone.block
  }
}
