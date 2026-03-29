#!/bin/bash

# 顏色
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # reset

echo -e "${BLUE}=============================="
echo -e "   Linux System Monitor"
echo -e "==============================${NC}"

# CPU
echo -e "\n${YELLOW}[CPU Usage]${NC}"
top -bn1 | grep "Cpu(s)" | awk '{print "Usage: " $2 + $4 "%"}'

# Memory
echo -e "\n${YELLOW}[Memory Usage]${NC}"
free -h | awk 'NR==2{printf "Used: %s / Total: %s\n", $3, $2}'

# Disk
echo -e "\n${YELLOW}[Disk Usage]${NC}"
df -h / | awk 'NR==2{print "Used: " $3 " / Total: " $2 " (" $5 ")"}'

# Process
echo -e "\n${YELLOW}[Top Processes]${NC}"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

# Uptime
echo -e "\n${YELLOW}[System Uptime]${NC}"
uptime

echo -e "\n${BLUE}==============================${NC}"
