resource "aws_security_group" "minecraft_server" {
  name        = "minecraft_server"
  description = "Allow TCP inbound traffic and all outbound traffic"
  vpc_id      = "vpc-0af49a5e13633839c"

  tags = {
    Name = "minecraft_server"
  }
}

resource "aws_vpc_security_group_ingress_rule" "minecraft_server_ssh" {
  security_group_id = aws_security_group.minecraft_server.id
  cidr_ipv4         = "186.155.12.50/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "minecraft_server_port" {
  for_each          = toset(local.allowed_ips)
  security_group_id = aws_security_group.minecraft_server.id
  cidr_ipv4         = each.value
  from_port         = 25565
  ip_protocol       = "tcp"
  to_port           = 25565
}