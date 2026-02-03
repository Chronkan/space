{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          ["AWS/EC2", "CPUUtilization", "InstanceId", "${instance_id}"],
          ["AWS/EC2", "NetworkIn", "InstanceId", "${instance_id}"],
          ["AWS/EC2", "NetworkOut", "InstanceId", "${instance_id}"]
        ],
        "period": 300,
        "stat": "Average",
        "region": "${region}",
        "title": "EC2 Instance Metrics"
      }
    },
    {
      "type": "text",
      "x": 0,
      "y": 7,
      "width": 3,
      "height": 3,
      "properties": {
        "markdown": "Testing"
      }
    }
  ]
}
