resource "aws_cloudwatch_log_group" "this" {
  name = "/${var.nullstone.env}/${var.nullstone.block}"

  tags = {
    Stack       = var.nullstone.stack
    Environment = var.nullstone.env
    Block       = var.nullstone.block
  }
}
