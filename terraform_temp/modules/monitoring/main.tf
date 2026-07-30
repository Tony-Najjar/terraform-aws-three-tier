resource "aws_sns_topic" "alerts" {

  name = "${var.project_name}-alerts"

}
resource "aws_sns_topic_subscription" "email" {

  topic_arn = aws_sns_topic.alerts.arn

  protocol = "email"

  endpoint = var.email

}
resource "aws_cloudwatch_metric_alarm" "alb_5xx_errors" {

  alarm_name = "${var.project_name}-alb-5xx-errors"

  alarm_description = "Alarm when ALB returns too many 5xx errors"

  namespace = "AWS/ApplicationELB"

  metric_name = "HTTPCode_ELB_5XX_Count"

  dimensions = {
    LoadBalancer = var.alb_arn_suffix
  }

  statistic = "Sum"

  period = 300

  evaluation_periods = 2

  threshold = 10

  comparison_operator = "GreaterThanThreshold"

  alarm_actions = [
    aws_sns_topic.alerts.arn
  ]

}
resource "aws_cloudwatch_metric_alarm" "ec2_cpu_high" {

  alarm_name = "${var.project_name}-ec2-high-cpu"

  alarm_description = "Alarm when EC2 CPU exceeds 80 percent"

  namespace = "AWS/EC2"

  metric_name = "CPUUtilization"

  statistic = "Average"

  period = 300

  evaluation_periods = 2

  threshold = 80

  comparison_operator = "GreaterThanThreshold"

  dimensions = {
    AutoScalingGroupName = "${var.project_name}-asg"
  }

  alarm_actions = [
    aws_sns_topic.alerts.arn
  ]

}

resource "aws_cloudwatch_metric_alarm" "rds_cpu_high" {

  alarm_name = "${var.project_name}-rds-high-cpu"

  alarm_description = "Alarm when RDS CPU exceeds 80 percent"

  namespace = "AWS/RDS"

  metric_name = "CPUUtilization"

  statistic = "Average"

  period = 300

  evaluation_periods = 2

  threshold = 80

  comparison_operator = "GreaterThanThreshold"

  dimensions = {
    DBInstanceIdentifier = var.rds_instance_id
  }

  alarm_actions = [
    aws_sns_topic.alerts.arn
  ]

}
resource "aws_cloudwatch_metric_alarm" "rds_low_storage" {

  alarm_name = "${var.project_name}-rds-low-storage"

  alarm_description = "Alarm when RDS free storage falls below 10GB"

  namespace = "AWS/RDS"

  metric_name = "FreeStorageSpace"

  statistic = "Average"

  period = 300

  evaluation_periods = 2

  threshold = 10737418240

  comparison_operator = "LessThanThreshold"

  dimensions = {
    DBInstanceIdentifier = var.rds_instance_id
  }

  alarm_actions = [
    aws_sns_topic.alerts.arn
  ]

}
resource "aws_cloudwatch_metric_alarm" "rds_high_connections" {

  alarm_name = "${var.project_name}-rds-high-connections"

  alarm_description = "Alarm when RDS database connections are too high"

  namespace = "AWS/RDS"

  metric_name = "DatabaseConnections"

  statistic = "Average"

  period = 300

  evaluation_periods = 2

  threshold = 80

  comparison_operator = "GreaterThanThreshold"

  dimensions = {
    DBInstanceIdentifier = var.rds_instance_id
  }

  alarm_actions = [
    aws_sns_topic.alerts.arn
  ]

}
