data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}


resource "aws_launch_template" "web" {

  name_prefix = "${var.project_name}-web-"

  image_id = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  vpc_security_group_ids = [
    var.security_group_id
  ]

  user_data = base64encode(<<EOF
#!/bin/bash
set -e

dnf update -y
dnf install -y nginx

systemctl enable nginx
systemctl start nginx

echo "<h1>Terraform AWS Three-Tier Project</h1>" > /usr/share/nginx/html/index.html

EOF
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.project_name}-web-server"
    }
  }
}

