data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["al2023-ami-2023.11.20260406.2-kernel-6.18-x86_64"]
  }
}