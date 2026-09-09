# Linux Server Monitoring & Automated Alert System

## Project Overview

A Bash-based Linux server monitoring system deployed on AWS EC2 using Amazon Linux.

The system monitors important server resources and generates alerts when predefined thresholds are exceeded.

## Technologies Used

- AWS EC2
- Amazon Linux
- Bash Shell Scripting
- Linux
- Cron
- systemctl
- Git
- GitHub

## Features

- CPU usage monitoring
- RAM usage monitoring
- Disk usage monitoring
- Server uptime monitoring
- SSH service monitoring
- Threshold-based alerts
- Monitoring logs
- Alert logs
- Automated execution using Cron

## Monitoring Thresholds

| Resource | Threshold |
|---|---:|
| CPU | 80% |
| RAM | 80% |
| Disk | 80% |

## How to Run

```bash
chmod +x monitor.sh
./monitor.sh
