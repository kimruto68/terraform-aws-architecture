provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_security_group" "web_sg" {
  name = "web_sg"

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
    cidr_blocks = ["0.0.0.0/0"] # tighten later
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "dockerhost" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = "docker_key"

  user_data = <<-EOF
#!/bin/bash

# Log everything
exec > /var/log/user-data.log 2>&1

# Fail fast
set -e

# Update system
dnf update -y

# Install packages with retry
for i in {1..3}; do
  dnf install -y docker git && break
  echo "Retrying package install..."
  sleep 5
done

# Start Docker
systemctl start docker
systemctl enable docker

# Wait for network stability
sleep 10

# Clone repo
git clone https://github.com/kimruto68/terraform-aws-architecture.git /home/ec2-user/site

# Verify clone
if [ ! -d "/home/ec2-user/site" ]; then
  echo "ERROR: Git clone failed"
  exit 1
fi

# Clean any existing container
docker rm -f nginxserver || true

# Run container
docker run -d -p 80:80 \
  -v /home/ec2-user/site/modules/aws-devops-portfolio:/usr/share/nginx/html:ro \
  --name nginxserver \
  nginx

EOF

  tags = {
    Name = "Terraform-Docker-Host"
  }
}

output "public_ip" {
  value = aws_instance.dockerhost.public_ip
}