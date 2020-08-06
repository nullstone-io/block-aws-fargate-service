data "terraform_remote_state" "cluster" {
  backend = "pg"

  workspace = "${var.nullstone.stack}-${var.nullstone.env}-${var.nullstone.parent_blocks.cluster}"

  config = {
    conn_str    = var.nullstone.backend_conn_str
    schema_name = var.nullstone.owner_id
  }
}

data "aws_ecs_cluster" "cluster" {
  cluster_name = data.terraform_remote_state.cluster.outputs.cluster_name
}

data "aws_iam_role" "execution" {
  name = data.terraform_remote_state.cluster.outputs.cluster_execution_role_name
}
