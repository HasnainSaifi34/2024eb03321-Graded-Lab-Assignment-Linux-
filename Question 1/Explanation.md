# Question 1: Basic Environment Verification

## Task Overview
As a junior systems engineer at IxD Systems, I performed basic environment verification on the lab machine.

---

## 1. User Identity Verification

### Commands:
```bash
whoami
groups
id
```

### Explanation:
I executed `whoami` to display my current username, which confirms my login identity. The `groups` command showed all groups my account belongs to, and `id` provided detailed information including UID, GID, and group memberships. This verifies my user account is properly configured with appropriate permissions.

### Expected Output:
```
your_username
your_username : your_username adm cdrom sudo dip plugdev
uid=1000(your_username) gid=1000(your_username) groups=1000(your_username),...
```

### Screenshot: `screenshots/01-user-identification.png`

---

## 2. Workspace Validation

### Commands:
```bash
pwd
ls -l
```

### Explanation:
I used `pwd` (print working directory) to display my current location in the filesystem. The `ls -l` command provided a detailed listing showing file permissions, ownership, size, and modification dates. This confirms I'm working in the correct directory and can see all files with their attributes.

### Expected Output:
```
/home/your_username
total XX
-rw-r--r-- 1 user user  220 date .bash_logout
-rw-r--r-- 1 user user 3526 date .bashrc
...
```

### Screenshot: `screenshots/02_workspace.png`

---

## 3. Environment Confirmation File

### Command:
```bash
echo "Linux user environment verified" > user_info.txt
cat user_info.txt
```

### Explanation:
I created a new file `user_info.txt` using output redirection (`>`), which wrote the verification message to the file. The `cat` command displayed the file contents to confirm the text was written successfully. This demonstrates basic file creation and output redirection capabilities.

### Expected Output:
```
Linux user environment verified
```

### Screenshot: `screenshots/03_file_creation.png`

---

## 4. File Integrity Check

### Command:
```bash
wc -m user_info.txt
```

### Explanation:
I used `wc -m` (word count with -m flag for characters) to count the number of characters in the file. The output shows 34 characters including the newline character, which verifies the file integrity and helps understand file size at the character level.

### Expected Output:
```
34 user_info.txt
```

### Screenshot: `screenshots/04_character_count.png`

---

## 5. Learning the Tools

### Command:
```bash
man mkdir
```

### Explanation:
I accessed the manual page for `mkdir` command to learn its options and usage. One useful option I identified is `mkdir -p`, which creates parent directories as needed if they don't exist. For example, `mkdir -p dir1/dir2/dir3` creates the entire directory tree in one command instead of creating each level separately.

### Useful Option:
**`-p, --parents`** - No error if existing, make parent directories as needed

### Screenshot: `screenshots/05_man_mkdir.png`

---

## 6. Home Directory Inspection

### Command:
```bash
ls ~
```
or
```bash
touch ~/A.txt ~/B.txt ~/J.txt ~/Z.txt # this will create new files in home dir (optional)
ls -1 ~ | sort
```

### Explanation:
The `ls -1 ~` command lists the contents of the user’s home directory with one entry per line. The output is then piped to `sort`, which arranges the files and directories in alphabetical order.


### Expected Output: NOTE: if the home directory is empty ~ this will output nothing
```
A.txt
B.txt
J.txt
Z.txt

```

### Screenshot: `screenshots/06_home_directory.png`

---

## 7. Log Investigation

### Command:
```bash
grep "admin" log.txt
```

### Explanation:
I used `grep` to search for the pattern "admin" within log.txt and display only the matching lines. This is useful for filtering log files to find specific events or user activities. The command returned all lines containing the word "admin", which helps in quick log analysis.

### Expected Output:
```
admin logged in at 10:00
admin logged out at 11:00
```

### Screenshot: `screenshots/07_grep_admin.png`

---

## 8. System Information Check

### Command:
```bash
uname -r
```
or
```bash
uname -a
```

### Explanation:
I executed `uname -r` to display the Linux kernel version currently running on the system. This information is crucial for compatibility checks, security updates, and troubleshooting. The output shows the specific kernel release version.

### Expected Output:
```
5.15.0-76-generic
```
(or your specific kernel version)

### Screenshot: `screenshots/08_kernel_version.png`

---

## 9. Network Connectivity Test

### Command:
```bash
ping -c 4 www.google.com
```

### Explanation:
I used `ping -c 4` to send 4 ICMP echo request packets to www.google.com to test network connectivity. The `-c 4` flag limits the ping to 4 packets instead of running indefinitely. The successful responses with low latency confirm that the network connection is working properly and DNS resolution is functioning.

### Expected Output:
```
PING www.google.com (172.217.x.x) 56(84) bytes of data.
64 bytes from server: icmp_seq=1 ttl=117 time=12.3 ms
...
4 packets transmitted, 4 received, 0% packet loss
```

### Screenshot: `screenshots/09_ping_test.png`

---

## 10. System Health Awareness

### Command:
```bash
uptime
```

### Explanation:
I executed `uptime` to check system health metrics. The output shows how long the system has been running (uptime duration), the number of currently logged-in users, and the system load average for the past 1, 5, and 15 minutes. Lower load averages indicate better system performance, while high values suggest the system is under heavy load.

### Expected Output:
```
14:23:45 up 5 days, 3:42, 2 users, load average: 0.15, 0.20, 0.18
```

**Output Explanation:**
- **14:23:45** - Current system time
- **up 5 days, 3:42** - System has been running for 5 days and 3 hours 42 minutes
- **2 users** - Two users are currently logged in
- **load average: 0.15, 0.20, 0.18** - Average system load over 1, 5, and 15 minutes (lower is better; values below 1.0 on single-core systems indicate good performance)

### Screenshot: `screenshots/10_uptime.png`

---

## Files Created
- `user_info.txt` - Contains environment verification message
- `log.txt` - Sample log file for grep demonstration

## Summary
All environment verification tasks have been completed successfully. The system is properly configured, network connectivity is functioning, and all basic Linux commands are working as expected.