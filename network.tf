locals {
  network_block = data.terraform_remote_state.cluster.outputs.network_block
}

data "terraform_remote_state" "network" {
  backend = "pg"

  workspace = "${var.nullstone.stack}-${var.nullstone.env}-${local.network_block}"

  config = {
    conn_str    = var.nullstone.backend_conn_str
    schema_name = var.nullstone.owner_id
  }
}