variable "owner_id" {
  type = string
}

variable "stack_name" {
  type = string
}

variable "env" {
  type = string
}

variable "block_name" {
  type = string
}

variable "parent_blocks" {
  type = object({
    cluster = string
  })
}

variable "backend_conn_str" {
  type = string
}


variable "enable_lb" {
  type    = bool
  default = true
}

variable "enable_https" {
  type    = bool
  default = false
}

variable "service_cpu" {
  type    = number
  default = 256
}

variable "service_memory" {
  type    = number
  default = 512
}
