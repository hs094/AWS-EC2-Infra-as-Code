provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # allow SSH from anywhere
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # allow HTTP from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # all traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami           = "ami-04b3f96fa99d40135"
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]

  key_name = "terraform-test"  # this must match your actual keypair name in AWS

  tags = {
    Name = "TerraformExampleInstance"
  }
}
