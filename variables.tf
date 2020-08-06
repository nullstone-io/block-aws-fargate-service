variable "nullstone" {
  type = object({
    owner_id : string
    stack : string
    env : string
    block : string
    parent_blocks : object({
      cluster : string
    })
    backend_conn_str : string
  })
}

variable "service_cpu" {
  type    = number
  default = 256
}

variable "service_memory" {
  type    = number
  default = 512
}
