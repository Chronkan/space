resource "aws_cloudwatch_dashboard" "test-dashboard" {
  count          = var.instance_id != "" ? 1 : 0
  dashboard_name = "test-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          metrics = [
            ["AWS/EC2", "CPUUtilization", "InstanceId", var.instance_id],
            ["AWS/EC2", "NetworkIn", "InstanceId", var.instance_id],
            ["AWS/EC2", "NetworkOut", "InstanceId", var.instance_id]
          ]
          period = 300
          stat   = "Average"
          region = var.region
          title  = "EC2 Instance Metrics"
        }
      },

      {
        type   = "text"
        x      = 0
        y      = 7
        width  = 3
        height = 3

        properties = {
          markdown = "Testing"
        }
      }
    ]
  })
}

resource "aws_cloudwatch_metric_alarm" "test_cpu_alarm" {
  count               = var.instance_id != "" ? 1 : 0
  alarm_name          = "test-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This metric monitors EC2 CPU utilization"
  dimensions = {
    InstanceId = var.instance_id
  }
}

resource "aws_cloudwatch_composite_alarm" "test_alarm" {
  count             = var.instance_id != "" ? 1 : 0
  alarm_description = "This is a composite alarm!"
  alarm_name        = "test-composite-alarm"

  alarm_actions = [aws_sns_topic.cpu-update.arn]
  ok_actions    = [aws_sns_topic.cpu-update.arn]

  alarm_rule = "ALARM(\"${aws_cloudwatch_metric_alarm.test_cpu_alarm[0].arn}\")"
}

resource "aws_sns_topic" "cpu-update" {
  name = "aws-cpu-update-topic"

}

resource "aws_sns_topic_subscription" "cpu_update_email" {
  topic_arn = aws_sns_topic.cpu-update.arn
  protocol  = "email"
  endpoint  = var.sns_endpoint

}
