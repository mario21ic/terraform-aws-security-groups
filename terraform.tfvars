region = "us-west-2"
env = "draft"
name = "demo"

vpc_id = "vpc-3763ca51"

ingress_sgs_qty = 2
ingress_sgs_rules = [
  {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    security_group_id = "sg-d981f7a3"
  },
  {
    from_port = 9000
    to_port   = 9000
    protocol  = "tcp"
    security_group_id  = "sg-0d85f377"
  }
]

ingress_self_rules = [
  {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
  },
  {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
  }
]

ingress_ips_rules = [
  {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_block = "0.0.0.0/16"
  },
  {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    cidr_block = "0.0.0.0/16"
  }
]

egress_sgs_qty = 2
egress_sgs_rules = [
  {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    security_group_id = "sg-d981f7a3"
  },
  {
    from_port = 9000
    to_port   = 9000
    protocol  = "tcp"
    security_group_id  = "sg-0d85f377"
  }
]

egress_self_rules = [
  {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
  },
  {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
  }
]

egress_ips_rules = [
  {
      from_port = 0
      to_port   = 0
      protocol  = "-1"
      cidr_block = "0.0.0.0/0"
  }
]
