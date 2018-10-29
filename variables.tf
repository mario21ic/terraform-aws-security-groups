variable "region" {
  description = "AWS Region"
}

variable "name" {
  description = "The name"
}

variable "env" {
  description = "Environment name, example: bmdev"
}

variable "ingress_sgs_qty" {
  default = 0
}
variable "ingress_sgs_rules" {
  type = "list"
  default = []
}

variable "ingress_self_rules" {
  type = "list"
  default = []
}

variable "ingress_ips_rules" {
  type = "list"
  default = []
}

variable "egress_sgs_qty" {
  default = 0
}
variable "egress_sgs_rules" {
  type = "list"
  default = []
}

variable "egress_self_rules" {
  type = "list"
  default = []
}

variable "egress_ips_rules" {
  type = "list"
  default = [
    {
      from_port = 0
      to_port   = 0
      protocol  = "-1"
      cidr_block = "0.0.0.0/0"
    }
  ]
}

# vpc variables
variable "vpc_id" {
  description = "vpc id"
}
