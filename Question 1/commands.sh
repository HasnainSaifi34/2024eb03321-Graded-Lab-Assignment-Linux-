#!/bin/bash

# Question 1: Basic Environment Verification
# IxD Systems - Junior Systems Engineer Task

echo "=========================================="
echo "1. User Identity Verification"
echo "=========================================="
whoami
echo ""
groups
echo ""
id
echo ""

echo "=========================================="
echo "2. Workspace Validation"
echo "=========================================="
pwd
echo ""
ls -l
echo ""

echo "=========================================="
echo "3. Environment Confirmation File"
echo "=========================================="
echo "Linux user environment verified" > user_info.txt
cat user_info.txt
echo ""

echo "=========================================="
echo "4. File Integrity Check"
echo "=========================================="
wc -m user_info.txt
echo ""

echo "=========================================="
echo "5. Learning the Tools"
echo "=========================================="
echo "Opening manual page for mkdir..."
man mkdir
# Note: This will open the manual page interactively
# Useful option: mkdir -p (creates parent directories as needed)
echo ""

echo "=========================================="
echo "6. Home Directory Inspection"
echo "=========================================="
touch ~/A.txt ~/B.txt ~/J.txt ~/Z.txt # Create files in home dir (Optional)
ls -1 ~ | sort
# or alternatively: 
echo ""

echo "=========================================="
echo "7. Log Investigation"
echo "=========================================="
# First, create a sample log.txt file for demonstration
echo "This is a sample log file" > log.txt
echo "admin logged in at 10:00" >> log.txt
echo "User performed some action" >> log.txt
echo "admin logged out at 11:00" >> log.txt
echo "Regular user activity" >> log.txt

grep "admin" log.txt
echo ""

echo "=========================================="
echo "8. System Information Check"
echo "=========================================="
uname -r
# or alternatively: uname -a (for complete system information)
echo ""

echo "=========================================="
echo "9. Network Connectivity Test"
echo "=========================================="
ping -c 4 www.google.com
echo ""

echo "=========================================="
echo "10. System Health Awareness"
echo "=========================================="
uptime
echo ""