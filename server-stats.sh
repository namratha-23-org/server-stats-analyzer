#!/bin/bash

echo "==============================="
echo "📊 Server Performance Analyzer"
echo "==============================="

# CPU Usage
echo -e "\n🧠 CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Load: " $2 + $4 "%"}'

# Memory Usage
echo -e "\n💾 Memory Usage:"
free -m | awk 'NR==2{printf "Used: %sMB / Total: %sMB (%.2f%%)\n", $3, $2, $3*100/$2 }'

# Disk Usage
echo -e "\n📁 Disk Usage:"
df -h | awk '$NF=="/"{printf "Used: %s / Total: %s (%s)\n", $3, $2, $5}'

# Top 5 processes by CPU
echo -e "\n🔥 Top 5 CPU-consuming Processes:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Top 5 processes by Memory
echo -e "\n💡 Top 5 Memory-consuming Processes:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
