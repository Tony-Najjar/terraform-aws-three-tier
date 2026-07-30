resource "aws_cloudwatch_dashboard" "main" {

  dashboard_name = "${var.project_name}-dashboard"

  dashboard_body = jsonencode({

    widgets = [

      {
        type = "metric"

        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {

          title = "EC2 CPU Utilization"

          metrics = [
            [
              "AWS/EC2",
              "CPUUtilization",
              "AutoScalingGroupName",
              "${var.project_name}-asg"
            ]
          ]

          period = 300

          stat = "Average"

          region = "us-east-1"

          view = "timeSeries"

        }
      },


      {
        type = "metric"

        x      = 0
        y      = 7
        width  = 12
        height = 6

        properties = {

          title = "RDS CPU Utilization"

          metrics = [
            [
              "AWS/RDS",
              "CPUUtilization",
              "DBInstanceIdentifier",
              var.rds_instance_id
            ]
          ]

          period = 300

          stat = "Average"

          region = "us-east-1"

          view = "timeSeries"

        }
      }

    ]

  })

}
