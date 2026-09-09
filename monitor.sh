#!/bin/bash

# Linux Server Monitoring & Automated Alert System

LOG_DIR="$HOME/linux-server-monitor/logs"
ALERT_DIR="$HOME/linux-server-monitor/alerts"

LOG_FILE="$LOG_DIR/monitoring.log"
ALERT_FILE="$ALERT_DIR/alert.log"

CPU_THRESHOLD=80
RAM_THRESHOLD=80
DISK_THRESHOLD=80

mkdir -p "$LOG_DIR"
mkdir -p "$ALERT_DIR"

DATE=$(date '+%Y-%m-%d %H:%M:%S')

CPU_USAGE=$(top -bn1 | awk '/Cpu/ {print 100 - $8}')
CPU_USAGE=${CPU_USAGE%.*}

RAM_USAGE=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

UPTIME=$(uptime -p)

echo "========================================" >> "$LOG_FILE"
echo "Monitoring Time: $DATE" >> "$LOG_FILE"
echo "CPU Usage: $CPU_USAGE%" >> "$LOG_FILE"
echo "RAM Usage: $RAM_USAGE%" >> "$LOG_FILE"
echo "Disk Usage: $DISK_USAGE%" >> "$LOG_FILE"
echo "Server Uptime: $UPTIME" >> "$LOG_FILE"

if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    MESSAGE="$DATE - WARNING: CPU usage is ${CPU_USAGE}%"
    echo "$MESSAGE" >> "$ALERT_FILE"
    echo "$MESSAGE"
fi

if [ "$RAM_USAGE" -gt "$RAM_THRESHOLD" ]; then
    MESSAGE="$DATE - WARNING: RAM usage is ${RAM_USAGE}%"
    echo "$MESSAGE" >> "$ALERT_FILE"
    echo "$MESSAGE"
fi

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    MESSAGE="$DATE - WARNING: Disk usage is ${DISK_USAGE}%"
    echo "$MESSAGE" >> "$ALERT_FILE"
    echo "$MESSAGE"
fi

SSH_STATUS=$(systemctl is-active sshd)

echo "SSH Service: $SSH_STATUS" >> "$LOG_FILE"

if [ "$SSH_STATUS" != "active" ]; then
    MESSAGE="$DATE - CRITICAL: SSH service is DOWN"
    echo "$MESSAGE" >> "$ALERT_FILE"
    echo "$MESSAGE"
fi

echo "Monitoring completed successfully."
