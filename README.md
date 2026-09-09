# Linux Server Monitoring & Automated Alert System

## 📌 Project Overview

This project is a Bash-based Linux server monitoring and automated alert system deployed on an AWS EC2 instance running Amazon Linux.

The system continuously checks important server resources such as CPU, RAM, disk usage, uptime, and system services. When a resource exceeds a predefined threshold, the system generates an alert and records the event in a log file.

The monitoring process is automated using Cron.

---

## 🎯 Objectives

- Monitor Linux server health
- Detect high resource utilization
- Monitor important system services
- Generate automated alerts
- Maintain monitoring and alert logs
- Automate monitoring using Cron
- Gain practical experience with Linux, Bash scripting, AWS EC2, and DevOps automation

---

## 🛠️ Technologies Used

- **AWS EC2**
- **Amazon Linux**
- **Linux**
- **Bash Shell Scripting**
- **Cron**
- **systemctl**
- **Git**
- **GitHub**

---

## ⚙️ Features

### System Resource Monitoring

The script monitors:

- CPU usage
- RAM usage
- Disk usage
- Server uptime

### Service Monitoring

The project checks important Linux services such as:

- SSH (`sshd`)

### Automated Alerts

Alerts are generated when predefined thresholds are exceeded.

Example:

```text
CPU Usage > 80%  → WARNING
RAM Usage > 80%  → WARNING
Disk Usage > 80% → WARNING
SSH Service Down → CRITICAL
```

### Logging

Monitoring information is stored in:

```text
logs/monitoring.log
```

Alerts are stored in:

```text
alerts/alert.log
```

### Automation

Cron automatically executes the monitoring script every 5 minutes.

```bash
*/5 * * * * /home/ec2-user/linux-server-monitor/monitor.sh
```

---

## 🏗️ Project Architecture

```text
                    AWS EC2
                       │
                       ▼
                 Amazon Linux
                       │
                       ▼
                  monitor.sh
                       │
        ┌──────────────┼──────────────┐
        ▼              ▼              ▼
       CPU            RAM            Disk
        │              │              │
        └──────────────┼──────────────┘
                       ▼
                Threshold Check
                       │
              ┌────────┴────────┐
              ▼                 ▼
            Normal           Critical
              │                 │
              ▼                 ▼
             Log              Alert
```

---

## 📁 Project Structure

```text
linux-server-monitor/
│
├── alerts/
│   └── alert.log
│
├── config/
│
├── logs/
│   └── monitoring.log
│
├── screenshots/
│
├── .gitignore
├── monitor.sh
└── README.md
```

---

## 🚀 Installation

Clone the repository:

```bash
git clone https://github.com/Esqutic/linux-server-monitor.git
```

Move into the project directory:

```bash
cd linux-server-monitor
```

Give the script execute permission:

```bash
chmod +x monitor.sh
```

Run the monitoring script:

```bash
./monitor.sh
```

---

## 📊 View Monitoring Logs

To view monitoring logs:

```bash
cat logs/monitoring.log
```

To view the latest entries:

```bash
tail -20 logs/monitoring.log
```

To view alerts:

```bash
cat alerts/alert.log
```

---

## ⏰ Cron Automation

The script can be scheduled using Cron.

Open the Cron configuration:

```bash
crontab -e
```

Add:

```bash
*/5 * * * * /home/ec2-user/linux-server-monitor/monitor.sh
```

Verify the Cron job:

```bash
crontab -l
```

---

## 🧪 Testing

The alert mechanism can be tested by generating CPU load.

Install `stress-ng`:

```bash
sudo dnf install -y stress-ng
```

Generate CPU load:

```bash
stress-ng --cpu 1 --timeout 60s
```

Run the monitoring script:

```bash
./monitor.sh
```

Check the alert log:

```bash
cat alerts/alert.log
```

If the CPU usage crosses the configured threshold, an alert should be generated.

---

## 🔐 Security

Sensitive files and credentials should never be uploaded to GitHub.

The `.gitignore` file excludes files such as:

```text
*.pem
*.ppk
.env
*.key
*.secret
```

AWS credentials, private keys, passwords, and API tokens must never be committed to the repository.

---

## 📸 Screenshots

The `screenshots` directory contains demonstrations of:

1. AWS EC2 instance
2. Amazon Linux terminal
3. Project structure
4. Monitoring output
5. CPU alert
6. Cron automation
7. Monitoring logs

---

## 🔮 Future Improvements

Planned improvements include:

- Email notifications
- Telegram notifications
- AWS CloudWatch integration
- Prometheus monitoring
- Grafana dashboard
- Systemd service integration
- Docker containerization
- Centralized log monitoring

---

## 📚 Learning Outcomes

Through this project, I gained practical experience with:

- Linux system administration
- Bash scripting
- Linux process and resource monitoring
- File permissions
- System services
- Cron automation
- AWS EC2
- Log management
- Git and GitHub
- Basic DevOps automation

---

## 👨‍💻 Author

**Esqutic**

GitHub:  
https://github.com/Esqutic
