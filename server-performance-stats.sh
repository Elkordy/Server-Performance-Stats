#!/bin/bash
echo ""  # Adds a space
# Total CPU usage
echo 1- Total CPU Usage
top -bn1 | grep "Cpu(s)"
echo ""  # Adds a space after the line


# Total memory usage Total memory usage (Free(Free vs Used including percentage)
echo  2- Total memory usage 

free -m | awk 'NR==2{used=$3; total=$2; free=$4; printf "Used: %dMB (%.2f%%)\nFree: %dMB (%.2f%%)\n", used, used/total*100, free, free/total*100}'
echo ""  # Adds a space after the line

# Total disk usage (Free vs Used including percentage)
echo  3- Total disk usage 
df -h | awk '$NF=="/"{used=$3; total=$2; free=$4; printf "Used: %s (%.2f%%)\nFree: %s (%.2f%%)\n", used, (used/total)*100, free, (free/total)*100}'
echo ""  # Adds a space 

#Top 5 processes by CPU usage
#Top 5 processes by CPU usage
echo 4- Top 5 processes by CPU 
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo ""  # Adds a space 


#Top 5 processes by CPU memory usage
echo 5- Top 5 processes by memory
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
