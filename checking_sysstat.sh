#!/bin/bash

# Define the directory with SAR logs
log_dir="/var/log/sa"

# Initialize variables for totals
total_memused=0
total_cpuused=0
count=0

# Process each daily log file for the past week
for log_file in $(ls $log_dir | grep '^sa[0-9]*$'); do
    # Extract average memory line from the log file
    avg_mem_line=$(sar -r -f $log_dir/$log_file | grep "Average:")
    
    # Parse %memused value
    memused=$(echo $avg_mem_line | awk '{print $5}')
    
    # Extract average CPU line from the log file
    avg_cpu_line=$(sar -u -f $log_dir/$log_file | grep "Average:")
    
    # Parse %idle value and convert it to %used
    cpu_idle=$(echo $avg_cpu_line | awk '{print $8}')
    cpuused=$(echo "100 - $cpu_idle" | bc )

    # Sum up values
    total_memused=$(echo "$total_memused + $memused" | bc)
    total_cpuused=$(echo "$total_cpuused + $cpuused" | bc)
    count=$((count + 1))
done

# Calculate weekly averages
avg_memused=$(echo "scale=2; $total_memused / $count" | bc)
avg_cpuused=$(echo "scale=3; $total_cpuused / $count" | bc)

# Get the disk usage percentage
disk_usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

# Output weekly averages and disk usage
echo "Weekly Average %memused: $avg_memused%"
echo "Weekly Average %cpuused: $avg_cpuused%"
echo "Current Disk Usage: $disk_usage%"

