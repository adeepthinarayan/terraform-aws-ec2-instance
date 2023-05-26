provider "aws" {
  region = "us-east-1"
}

data "aws_ami_ids" "latest_ami_ubuntu" {
  owners = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-*-amd64-server-*"]
  }
}

resource "aws_instance" "my_ec2_server" {
  ami           = data.aws_ami_ids.latest_ami_ubuntu.ids[4]
  instance_type = "t2.micro"

  tags = {
    name = "thinknyx"
  }
}

