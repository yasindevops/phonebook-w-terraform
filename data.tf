data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
}


data "aws_vpc" "selected" {
  default = true
}

data "aws_subnets" "pb-subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  #   filter {                       #  Notes:  A load balancer cannot be attached to multiple subnets in the same Availability Zone.
  #     name   = "tag:Name"
  #     values = ["default*"]
  #   }
}