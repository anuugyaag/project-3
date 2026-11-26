output "instance_id" {
  value = aws_instance.monitoring_ec2.id
}

output "public_ip" {
  value = aws_instance.monitoring_ec2.public_ip
}

output "alarm_name" {
  value = aws_cloudwatch_metric_alarm.cpu_alarm.alarm_name
}
