resource "aws_autoscaling_group" "web" {

  name = "${var.project_name}-asg"

  desired_capacity = var.desired_capacity
  min_size         = var.min_size
  max_size         = var.max_size

  vpc_zone_identifier = [
    var.private_subnet_1,
    var.private_subnet_2
  ]

  target_group_arns = [
    var.target_group_arn
  ]

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  health_check_type = "ELB"

  tag {
    key                 = "Name"
    value               = "${var.project_name}-web-server"
    propagate_at_launch = true
  }
}
