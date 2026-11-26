
# Get the latest Amazon Linux 2023 AMI
data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

# Create a new EC2 instance
resource "aws_instance" "monitoring_ec2" {
  ami           = data.aws_ssm_parameter.amazon_linux.value
  instance_type = "t3.micro"

  # Use the existing public subnet
  subnet_id                   = "subnet-0d48f28b38b5dd46d"
  associate_public_ip_address = true

  # Enable detailed CloudWatch monitoring
  monitoring = true

  # Generate CPU load
  user_data = file("${path.module}/userdata.sh")

  tags = {
    Name = "CloudWatch-Monitoring-EC2"
  }
}

# Create CloudWatch CPU utilization alarm
resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name        = "EC2-High-CPU-Alarm"
  alarm_description = "Alarm when EC2 CPU utilization exceeds 1 percent"

  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  datapoints_to_alarm = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 1

  dimensions = {
    InstanceId = aws_instance.monitoring_ec2.id
  }

  treat_missing_data = "notBreaching"
}

