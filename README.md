# EC2 State Monitoring with CloudWatch Alarm Using Terraform

## Project Overview
This project deploys an EC2 instance using Terraform and monitors its CPU utilization through Amazon CloudWatch.

## AWS Services Used
- Amazon EC2
- Amazon CloudWatch

## Tools Used
- Terraform
- AWS
- Linux

## Project Tasks
1. Deploy an EC2 instance using Terraform.
2. Create a CloudWatch CPU utilization alarm.
3. Set the CPU threshold to 1%.
4. Configure the alarm evaluation period to 1 minute.
5. Generate CPU load and verify the alarm state.

## Deployment Commands

Initialize:
```bash
terraform init

