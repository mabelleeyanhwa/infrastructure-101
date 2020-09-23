provider "aws" {
  region = "ap-southeast-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  user_data = local.user_data
  tags = {
    Name = "HelloSpringBoot"
  }
}

provisioner "file" {
  source      = "hello-spring-boot-0.1.0.jar"
  destination = "/home/hello-spring-boot-0.1.0.jar"

  connection {
    type        = "ssh"
    user        = "root"
    private_key = "${file("~/.ssh/mykeyfile.pem")}"
  }
}
