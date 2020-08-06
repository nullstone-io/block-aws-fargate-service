// This is a bit odd - we're creating a repository for every environment
// We need to find a better way to do this
resource "aws_ecr_repository" "this" {
  name = "${var.nullstone.stack}/${var.nullstone.env}-${var.nullstone.block}"

  tags = {
    Stack       = var.nullstone.stack
    Environment = var.nullstone.env
    Block       = var.nullstone.block
  }
}
