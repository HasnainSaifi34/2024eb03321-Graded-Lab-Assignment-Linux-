#!/bin/bash
# Question 4: System Monitoring and Process Management
# All operations performed within user account without system configuration changes

echo "=========================================="
echo "1. System Uptime Verification"
echo "=========================================="
uptime
echo ""
uptime -p
echo ""
uptime -s
echo ""

echo "=========================================="
echo "2. User Process Listing"
echo "=========================================="
ps -u $USER
echo ""
echo "Alternative detailed view:"
ps -u $USER -f
echo ""

echo "=========================================="
echo "3. CPU Usage Analysis"
echo "=========================================="
echo "Top CPU-consuming processes for current user:"
ps -u $USER -o pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -10
echo ""
echo "Real-time view using top (will display for 3 iterations):"
top -b -n 3 -u $USER | head -20
echo ""

echo "=========================================="
echo "4. Background Process Execution"
echo "=========================================="
echo "Starting a sleep command in background..."
sleep 300 &
BG_PID=$!
echo "Background process started with PID: $BG_PID"
echo ""
echo "Verifying background process is running:"
jobs
echo ""
ps -p $BG_PID -f
echo ""

echo "=========================================="
echo "5. Process Priority Management"
echo "=========================================="
echo "Current priority of background process (PID: $BG_PID):"
ps -o pid,ni,cmd -p $BG_PID
echo ""
echo "Changing niceness to 10..."
renice -n 10 -p $BG_PID
echo ""
echo "Updated priority:"
ps -o pid,ni,cmd -p $BG_PID
echo ""
echo "Killing the background process..."
kill $BG_PID
echo ""

echo "=========================================="
echo "6. Memory Usage Monitoring"
echo "=========================================="
free -h
echo ""
echo "Detailed memory information:"
cat /proc/meminfo | head -20
echo ""
echo "Memory usage by current user processes:"
ps -u $USER -o pid,cmd,%mem --sort=-%mem | head -10
echo ""

echo "=========================================="
echo "7. Disk Space Inspection"
echo "=========================================="
df -h ~
echo ""
echo "Detailed filesystem information:"
df -Th ~
echo ""

echo "=========================================="
echo "8. Shell Identification"
echo "=========================================="
echo $SHELL
echo ""
echo "Current shell process:"
ps -p $$
echo ""
echo "Shell version:"
$SHELL --version
echo ""

echo "=========================================="
echo "9. Output Redirection"
echo "=========================================="
echo "Redirecting system information to system_report.txt..."
{
    echo "=== SYSTEM REPORT ==="
    echo "Generated on: $(date)"
    echo ""
    echo "--- System Information ---"
    uname -a
    echo ""
    echo "--- Uptime ---"
    uptime
    echo ""
    echo "--- Memory Usage ---"
    free -h
    echo ""
    echo "--- Disk Usage ---"
    df -h
    echo ""
    echo "--- CPU Information ---"
    lscpu | head -15
    echo ""
    echo "--- Current User Processes ---"
    ps -u $USER -f
    echo ""
    echo "=== END OF REPORT ==="
} > system_report.txt

echo "System report created successfully!"
echo ""
echo "Displaying contents of system_report.txt:"
cat system_report.txt
echo ""

echo "=========================================="
echo "10. Disk Usage Visualization"
echo "=========================================="
echo "Using ncdu to analyze disk usage..."
echo ""
echo "Note: ncdu is an interactive tool. Running in non-interactive mode for demonstration."
echo ""
echo "Installing ncdu if not present (may require sudo):"
echo "sudo apt-get install ncdu  # For Debian/Ubuntu"
echo "sudo yum install ncdu      # For RHEL/CentOS"
echo ""
echo "Running ncdu on home directory:"
# Check if ncdu is installed
if command -v ncdu &> /dev/null; then
    echo "ncdu is installed. Running analysis..."
    # Non-interactive export mode
    ncdu -0 -o ncdu_output.txt ~
    echo "Output saved to ncdu_output.txt"
    echo ""
    echo "To view interactively, run: ncdu -f ncdu_output.txt"
    echo ""
    echo "Alternative: Using du for similar information:"
    du -h ~ --max-depth=2 | sort -hr | head -20
else
    echo "ncdu is not installed. Using du as alternative:"
    du -h ~ --max-depth=2 | sort -hr | head -20
    echo ""
    echo "To install ncdu, use:"
    echo "  Ubuntu/Debian: sudo apt-get install ncdu"
    echo "  RHEL/CentOS: sudo yum install ncdu"
fi
echo ""
echo "Common ncdu usage:"
echo "  ncdu ~              # Scan and browse home directory"
echo "  ncdu -x ~           # Don't cross filesystem boundaries"
echo "  ncdu -e ~           # Enable extended information"
echo "  ncdu --exclude .git # Exclude specific directories"
echo ""