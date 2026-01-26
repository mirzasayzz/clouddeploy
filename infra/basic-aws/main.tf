provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu 20.04 LTS (Example AMI)
  instance_type = "t2.micro"
  key_name      = "my-deploy-key"

  tags = {
    Name = "CloudDeploy-WebServer"
    Project = "CloudDeploy"
  }

  security_groups = [aws_security_group.web_sg.name]
}

resource "aws_security_group" "web_sg" {
  name        = "web_server_sg"
  description = "Allow HTTP and SSH traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_ip" {
  value = aws_instance.web_server.public_ip
  description = "The public IP of the web server"
}
