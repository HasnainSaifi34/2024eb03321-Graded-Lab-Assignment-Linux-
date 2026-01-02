# Question 4: System Monitoring and Process Management

## Task Overview
As part of system administration responsibilities, I performed various system monitoring and process management tasks within my user account without making any system configuration changes. These operations demonstrate understanding of process management, resource monitoring, and system information retrieval.

---

## 1. System Uptime Verification

### Commands:
```bash
uptime
uptime -p
uptime -s
```

### Explanation:
I executed the `uptime` command to display how long the system has been running since the last boot. The basic `uptime` command shows the current time, uptime duration, number of logged-in users, and load averages. The `-p` flag displays uptime in a human-friendly format (e.g., "up 2 days, 5 hours"), and `-s` shows the exact date and time when the system was booted.

### Expected Output:
```
 15:42:18 up 3 days,  7:23,  2 users,  load average: 0.52, 0.48, 0.45
up 3 days, 7 hours, 23 minutes
2025-12-30 08:19:15
```

### Screenshot: `Screenshots/01_system_uptime.png`

---

## 2. User Process Listing

### Commands:
```bash
ps -u $USER
ps -u $USER -f
```

### Explanation:
I used the `ps` command with the `-u` flag to list all processes running under my user account. The `$USER` variable automatically references my username. The first command shows a basic process list with PID, terminal, CPU time, and command name. Adding the `-f` flag provides a full-format listing with additional details like parent process ID (PPID), start time, and complete command line arguments.

### Expected Output:
```
  PID TTY          TIME CMD
 1234 pts/0    00:00:00 bash
 5678 pts/0    00:00:00 ps

UID        PID  PPID  C STIME TTY          TIME CMD
user      1234  1200  0 08:30 pts/0    00:00:00 -bash
user      5678  1234  0 15:42 pts/0    00:00:00 ps -u user -f
```

### Screenshot: `Screenshots/02_user_processes.png`

---

## 3. CPU Usage Analysis

### Commands:
```bash
ps -u $USER -o pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -10
top -b -n 3 -u $USER | head -20
```

### Explanation:
I identified the highest CPU-consuming processes using `ps` with custom output format (`-o`) and sorted by CPU usage in descending order (`--sort=-%cpu`). The command displays PID, parent PID, command name, CPU percentage, and memory percentage. Additionally, I used `top` in batch mode (`-b`) for 3 iterations (`-n 3`) filtered for my user (`-u $USER`) to get real-time CPU usage statistics of my processes.

### Expected Output:
```
  PID  PPID CMD                         %CPU %MEM
 2345  1234 /usr/bin/python3 script.py   5.2  2.1
 1234  1200 -bash                         0.0  0.3
 5679  1234 ps -u user                    0.0  0.2

top - 15:42:18 up 3 days,  7:23,  2 users,  load average: 0.52, 0.48, 0.45
Tasks:  12 total,   1 running,  11 sleeping...
%Cpu(s):  2.3 us,  1.2 sy,  0.0 ni, 96.5 id...
```

### Screenshot: `Screenshots/03_cpu_usage.png`

---

## 4. Background Process Execution

### Commands:
```bash
sleep 300 &
jobs
ps -p $BG_PID -f
```

### Explanation:
I started a `sleep 300` command in the background using the `&` operator, which allows the command to run while returning control to the shell. The shell returned the background job number and PID. I then verified the process using the `jobs` command (shows background jobs in the current shell) and `ps -p` (displays detailed information for the specific process ID), confirming the background process is actively running.

### Expected Output:
```
[1] 6789
Background process started with PID: 6789

[1]+  Running                 sleep 300 &

UID        PID  PPID  C STIME TTY          TIME CMD
user      6789  1234  0 15:42 pts/0    00:00:00 sleep 300
```

### Screenshot: `Screenshots/04_background_process.png`

---

## 5. Process Priority Management

### Commands:
```bash
ps -o pid,ni,cmd -p $BG_PID
renice -n 10 -p $BG_PID
ps -o pid,ni,cmd -p $BG_PID
kill $BG_PID
```

### Explanation:
I changed the process priority (niceness) of the background process using the `renice` command. The niceness value ranges from -20 (highest priority) to 19 (lowest priority), with 0 being the default. I set the niceness to 10 using `renice -n 10`, making the process lower priority so it consumes fewer CPU resources when the system is busy. The `ps` command with custom output format showed the nice value (NI column) before and after the change. Finally, I terminated the background process using `kill`.

### Expected Output:
```
  PID  NI CMD
 6789   0 sleep 300

6789 (process ID) old priority 0, new priority 10

  PID  NI CMD
 6789  10 sleep 300
```

### Screenshot: `Screenshots/05_process_priority.png`

---

## 6. Memory Usage Monitoring

### Commands:
```bash
free -h
cat /proc/meminfo | head -20
ps -u $USER -o pid,cmd,%mem --sort=-%mem | head -10
```

### Explanation:
I monitored system memory usage using multiple approaches. The `free -h` command displays total, used, free, shared, buffer/cache, and available memory in human-readable format (MB/GB). The `/proc/meminfo` file provides detailed kernel memory statistics including different memory types and allocation details. Finally, I listed my user processes sorted by memory consumption to identify which of my processes are using the most RAM.

### Expected Output:
```
              total        used        free      shared  buff/cache   available
Mem:           15Gi       8.2Gi       2.1Gi       324Mi       5.1Gi       6.5Gi
Swap:         2.0Gi       256Mi       1.7Gi

MemTotal:       16384000 kB
MemFree:         2150000 kB
MemAvailable:    6750000 kB
Buffers:          450000 kB
...

  PID CMD                         %MEM
 2345 /usr/bin/python3 script.py   2.1
 1234 -bash                         0.3
```

### Screenshot: `Screenshots/06_memory_usage.png`

---

## 7. Disk Space Inspection

### Commands:
```bash
df -h ~
df -Th ~
```

### Explanation:
I inspected the disk space usage of the filesystem containing my home directory using the `df` command. The `-h` flag displays sizes in human-readable format (KB, MB, GB), while the `-T` flag additionally shows the filesystem type (ext4, xfs, etc.). The output shows total size, used space, available space, usage percentage, and mount point of the filesystem where my home directory resides, which is essential for monitoring disk capacity.

### Expected Output:
```
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1       100G   45G   50G  48% /

Filesystem     Type  Size  Used Avail Use% Mounted on
/dev/sda1      ext4  100G   45G   50G  48% /
```

### Screenshot: `Screenshots/07_disk_space.png`

---

## 8. Shell Identification

### Commands:
```bash
echo $SHELL
ps -p $$
$SHELL --version
```

### Explanation:
I identified the current shell using multiple methods. The `$SHELL` environment variable displays the path to my default shell (typically /bin/bash or /bin/zsh). The `ps -p $$` command shows the process information for the current shell, where `$$` is a special variable representing the PID of the current shell process. Finally, I displayed the shell version to get detailed information about which release is being used.

### Expected Output:
```
/bin/bash

  PID TTY          TIME CMD
 1234 pts/0    00:00:00 bash

GNU bash, version 5.1.16(1)-release (x86_64-pc-linux-gnu)
Copyright (C) 2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
```

### Screenshot: `Screenshots/08_shell_identification.png`

---

## 9. Output Redirection

### Commands:
```bash
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

cat system_report.txt
```

### Explanation:
I created a comprehensive system report by redirecting the output of multiple system information commands into a single file named `system_report.txt` using the `>` operator. The curly braces `{}` group multiple commands together so their combined output is redirected to one file. The report includes system information (kernel version), uptime, memory usage, disk usage, CPU details, and current user processes. I then displayed the file contents using `cat` to verify the redirection was successful.

### Expected Output:
```
System report created successfully!

=== SYSTEM REPORT ===
Generated on: Fri Jan  2 15:42:30 IST 2026

--- System Information ---
Linux hostname 5.15.0-76-generic #83-Ubuntu SMP x86_64 GNU/Linux

--- Uptime ---
 15:42:30 up 3 days,  7:23,  2 users,  load average: 0.52, 0.48, 0.45

--- Memory Usage ---
              total        used        free      shared  buff/cache   available
Mem:           15Gi       8.2Gi       2.1Gi       324Mi       5.1Gi       6.5Gi
...

=== END OF REPORT ===
```

### Screenshot: `Screenshots/09_output_redirection.png`

---

## 10. Disk Usage Visualization

### Commands:
```bash
# If ncdu is installed:
ncdu -0 -o ncdu_output.txt ~
ncdu -f ncdu_output.txt

# Alternative if ncdu is not installed:
du -h ~ --max-depth=2 | sort -hr | head -20

# Common ncdu options:
ncdu ~              # Scan and browse home directory
ncdu -x ~           # Don't cross filesystem boundaries
ncdu -e ~           # Enable extended information
ncdu --exclude .git # Exclude specific directories
```

### Explanation:
I demonstrated the `ncdu` (NCurses Disk Usage) tool, which is an interactive disk usage analyzer with a text-based user interface. The `-0` flag exports to a file format, and `-o` saves the scan results to `ncdu_output.txt` for later viewing with `-f`. The tool provides a navigable directory tree showing disk space consumption, making it easy to identify large files and directories. If `ncdu` is not installed, I used `du` with sorting as an alternative. The `ncdu` interface allows drilling down into directories, deleting files, and getting detailed size information interactively.

### Expected Output:
```
Using ncdu to analyze disk usage...

ncdu is installed. Running analysis...
Output saved to ncdu_output.txt
To view interactively, run: ncdu -f ncdu_output.txt

Alternative output using du:
150M    /home/user
 80M    /home/user/Documents
 45M    /home/user/Downloads
 15M    /home/user/.cache
  5M    /home/user/Pictures
...

Common ncdu usage:
  ncdu ~              # Scan and browse home directory
  ncdu -x ~           # Don't cross filesystem boundaries
  ncdu -e ~           # Enable extended information
  ncdu --exclude .git # Exclude specific directories
```

**What ncdu shows:**
- Interactive browsing of directory structure
- Size of each directory and file
- Percentage of parent directory space used
- Ability to navigate with arrow keys
- Option to delete files/directories directly
- Visual representation with color-coded bars

### Screenshot: `Screenshots/10_disk_visualization.png`

---

## Files Created
- `system_report.txt` - Comprehensive system information report
- `ncdu_output.txt` - Disk usage analysis output (if ncdu was run)

## Summary
Successfully completed all system monitoring and process management tasks within my user account. Demonstrated understanding of process listing, CPU and memory monitoring, background job management, process priority adjustment, disk space inspection, and output redirection. Verified system uptime, identified the current shell, and created a comprehensive system report. All operations were performed without making any system configuration changes, ensuring the integrity of the system environment.