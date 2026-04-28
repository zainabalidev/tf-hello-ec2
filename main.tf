locals {
    resource_name = "${var.name_prefix}-server"
}

resource "aws_instance" "server" {
  count = var.instance_count
  
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.server_sg.id]

  tags = {
    Name = "${local.resource_name}-server-${count.index + 1}"
    ManagedBy = "Terraform"
  }
}

resource "aws_instance" "docker_host" {
  
  ami           = data.aws_ami.ubuntu.id 
  instance_type = var.instance_type

  user_data = file("${path.module}/install_docker.sh")

  user_data_replace_on_change = true

  tags = {
    Name = "Ubuntu-Docker-Host"
  }
}

resource "aws_security_group" "server_sg" {
  name = "${local.resource_name}-sg"
  description = "Ingress rule for SSH" 

  tags = {
     name = "${local.resource_name}-sg"
      ManagedBy = "Terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" { 

  security_group_id = aws_security_group.server_sg.id

  cidr_ipv4 = "0.0.0.0/0" 

  from_port = 22 

  ip_protocol = "tcp" 

  to_port = 22 

}

resource "aws_vpc_security_group_ingress_rule" "allow_http" { 

  security_group_id = aws_security_group.server_sg.id

  cidr_ipv4 = "0.0.0.0/0" 

  from_port = 80 

  ip_protocol = "tcp" 

  to_port = 80 

}