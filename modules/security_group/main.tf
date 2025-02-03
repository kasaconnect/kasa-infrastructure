# -----------------------------------------------------------------------------------------------------------
# Security groups
# -----------------------------------------------------------------------------------------------------------

resource "aws_security_group" "main" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = false
  }

  tags = {
    Name = var.name
  }
}

# Ingress rules
resource "aws_vpc_security_group_ingress_rule" "main" {
  for_each = { for id, rule in var.ingress_rules : id => rule }

  security_group_id = aws_security_group.main.id
  description       = "Port ${each.value.from_port} to ${each.value.to_port} ${each.value.ip_protocol} from ${replace(each.value.cidr_ipv4, "{VPC_ID}", data.aws_vpc.main.cidr_block)} CIDR"
  cidr_ipv4         = replace(each.value.cidr_ipv4, "{VPC_ID}", data.aws_vpc.main.cidr_block)
  from_port         = each.value.from_port
  ip_protocol       = each.value.ip_protocol
  to_port           = each.value.to_port

  tags = {
    Name = var.name
  }
}

# Ingress rules
resource "aws_vpc_security_group_ingress_rule" "referenced_sg_ingress" {
  for_each = { for id, rule in var.referenced_sg_ingress : id => rule }

  security_group_id = aws_security_group.main.id
  description       = "Allow inbound traffic"
  referenced_security_group_id = each.value.referenced_security_group_id
  from_port         = each.value.from_port
  ip_protocol       = each.value.ip_protocol
  to_port           = each.value.to_port

  tags = {
    Name = var.name
  }
}

# Egress rules
resource "aws_vpc_security_group_egress_rule" "main" {
  for_each = { for id, rule in var.egress_rules : id => rule }

  security_group_id = aws_security_group.main.id
  description       = "Rule for ${each.value.ip_protocol} ${replace(each.value.cidr_ipv4, "{VPC_ID}", data.aws_vpc.main.cidr_block)} CIDR"
  cidr_ipv4         = replace(each.value.cidr_ipv4, "{VPC_ID}", data.aws_vpc.main.cidr_block)
  from_port         = each.value.from_port
  ip_protocol       = each.value.ip_protocol
  to_port           = each.value.to_port

  tags = {
    Name = var.name
  }
}
