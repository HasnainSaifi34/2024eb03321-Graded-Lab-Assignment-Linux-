# Question 3: File Links and Disk Usage Management

## Task Overview
As part of understanding Linux file system management, I performed operations related to file links (hard and symbolic) and disk usage analysis within my user space.

---

## 1. File Creation

### Commands:
```bash
cd ~
echo "This is sample data for understanding Linux links and disk usage." > sample_data.txt
echo "It contains multiple lines of text." >> sample_data.txt
echo "We will use this file to demonstrate hard and soft links." >> sample_data.txt
cat sample_data.txt
```

### Explanation:
I navigated to my home directory and created a file named `sample_data.txt` using output redirection. The first `echo` command with `>` creates the file and writes the first line, while subsequent commands with `>>` append additional lines. The `cat` command displays the file contents to verify successful creation.

### Expected Output:
```
This is sample data for understanding Linux links and disk usage.
It contains multiple lines of text.
We will use this file to demonstrate hard and soft links.
```

### Screenshot: `Screenshots/01_file_creation.png`

---

## 2. Hard Link Creation

### Command:
```bash
ln sample_data.txt sample_hard.txt
ls -l sample_*.txt
```

### Explanation:
I created a hard link named `sample_hard.txt` pointing to `sample_data.txt` using the `ln` command. A hard link creates another directory entry pointing to the same inode as the original file. The `ls -l` command shows both files with identical file sizes and the link count of 2, indicating they share the same data on disk.

### Expected Output:
```
-rw-rw-r-- 2 user user 162 Jan  2 14:30 sample_data.txt
-rw-rw-r-- 2 user user 162 Jan  2 14:30 sample_hard.txt
```

### Screenshot: `Screenshots/02_hard_link.png`

---

## 3. Symbolic Link Creation

### Command:
```bash
ln -s sample_data.txt sample_soft.txt
ls -l sample_*.txt
```

### Explanation:
I created a symbolic (soft) link using `ln -s`, which creates a pointer file that references the original filename. The `ls -l` output shows `sample_soft.txt` with an `l` at the beginning (indicating it's a link) and an arrow (`->`) pointing to the target file. Symbolic links have their own inode and act as shortcuts to the original file.

### Expected Output:
```
-rw-rw-r-- 2 user user 162 Jan  2 14:30 sample_data.txt
-rw-rw-r-- 2 user user 162 Jan  2 14:30 sample_hard.txt
lrwxrwxrwx 1 user user  16 Jan  2 14:31 sample_soft.txt -> sample_data.txt
```

### Screenshot: `Screenshots/03_symbolic_link.png`

---

## 4. Inode Verification

### Command:
```bash
ls -i sample_data.txt sample_hard.txt sample_soft.txt
```

### Explanation:
I used `ls -i` to display the inode numbers of all three files. The inode is a unique identifier for file metadata in the file system. The output shows that `sample_data.txt` and `sample_hard.txt` share the same inode number, while `sample_soft.txt` has a different inode number because it's a separate file that contains a reference to the original.

### Expected Output:
```
1234567 sample_data.txt
1234567 sample_hard.txt
1234568 sample_soft.txt
```
(Note: Actual inode numbers will vary)

### Screenshot: `Screenshots/04_inode_verification.png`

---

## 5. Inode Analysis

### Command:
```bash
stat sample_data.txt sample_hard.txt sample_soft.txt
```

### Explanation:
I executed the `stat` command to display comprehensive metadata for all three files, including inode numbers, link counts, permissions, and timestamps. The analysis reveals that `sample_data.txt` and `sample_hard.txt` share the same inode because hard links point directly to the same data blocks on disk. In contrast, `sample_soft.txt` has a different inode because symbolic links are independent files containing only a path reference to the target file.

### Expected Output:
```
  File: sample_data.txt
  Size: 162       	Blocks: 8          IO Block: 4096   regular file
Device: 803h/2051d	Inode: 1234567     Links: 2
...

  File: sample_hard.txt
  Size: 162       	Blocks: 8          IO Block: 4096   regular file
Device: 803h/2051d	Inode: 1234567     Links: 2
...

  File: sample_soft.txt -> sample_data.txt
  Size: 16        	Blocks: 0          IO Block: 4096   symbolic link
Device: 803h/2051d	Inode: 1234568     Links: 1
...
```

### Screenshot: `Screenshots/05_inode_analysis.png`

---

## 6. File Metadata Inspection

### Commands:
```bash
ls -l sample_data.txt
stat sample_data.txt
```

### Explanation:
I displayed detailed file information using both `ls -l` and `stat` commands. The `ls -l` output shows permissions (-rw-rw-r--), link count (2), owner, group, size in bytes, modification timestamp, and filename. The `stat` command provides even more comprehensive metadata including inode number, device ID, access/modify/change times, and block allocation information.

### Expected Output:
```
-rw-rw-r-- 2 user user 162 Jan  2 14:30 sample_data.txt

  File: sample_data.txt
  Size: 162       	Blocks: 8          IO Block: 4096   regular file
Device: 803h/2051d	Inode: 1234567     Links: 2
Access: (0664/-rw-rw-r--)  Uid: ( 1000/    user)   Gid: ( 1000/    user)
Access: 2026-01-02 14:30:15.123456789 +0530
Modify: 2026-01-02 14:30:15.123456789 +0530
Change: 2026-01-02 14:30:20.123456789 +0530
 Birth: -
```

### Screenshot: `Screenshots/06_file_metadata.png`

---

## 7. Disk Usage Check

### Commands:
```bash
du -h ~
du -sh ~
```

### Explanation:
I used the `du` (disk usage) command with the `-h` flag to display sizes in human-readable format (KB, MB, GB). The first command shows disk usage for all subdirectories within the home directory, while `du -sh` provides a summary total of the entire home directory. This helps monitor storage consumption and identify space usage patterns.

### Expected Output:
```
4.0K	/home/user/.cache
8.0K	/home/user/Documents
12K	    /home/user/Downloads
...
150M	/home/user
```

### Screenshot: `Screenshots/07_disk_usage.png`

---

## 8. File Size Overview

### Commands:
```bash
ls -lh ~
ls -lhS ~ | head -20
```

### Explanation:
I executed `ls -lh` to list all files in the home directory with file sizes displayed in human-readable format (K, M, G). The `-h` flag converts bytes to more understandable units. The second command with `-S` sorts files by size in descending order and pipes to `head -20` to show the 20 largest files, making it easy to identify which files consume the most space.

### Expected Output:
```
total 24K
-rw-rw-r-- 2 user user  162 Jan  2 14:30 sample_data.txt
-rw-rw-r-- 2 user user  162 Jan  2 14:30 sample_hard.txt
lrwxrwxrwx 1 user user   16 Jan  2 14:31 sample_soft.txt -> sample_data.txt
drwxrwxr-x 2 user user 4.0K Jan  2 10:00 Documents
...
```

### Screenshot: `Screenshots/08_file_size_overview.png`

---

## 9. Link Deletion Test

### Commands:
```bash
ls -l sample_*.txt
rm sample_soft.txt
ls -l sample_*.txt
cat sample_data.txt
```

### Explanation:
I deleted the symbolic link `sample_soft.txt` using the `rm` command and verified the original file remains intact. When a symbolic link is removed, only the link file itself is deleted, not the target file it points to. The `cat` command confirms that `sample_data.txt` still exists and contains all its original data, demonstrating that symbolic links are independent references.

### Expected Output:
```
Before deletion:
-rw-rw-r-- 2 user user 162 Jan  2 14:30 sample_data.txt
-rw-rw-r-- 2 user user 162 Jan  2 14:30 sample_hard.txt
lrwxrwxrwx 1 user user  16 Jan  2 14:31 sample_soft.txt -> sample_data.txt

After deletion:
-rw-rw-r-- 2 user user 162 Jan  2 14:30 sample_data.txt
-rw-rw-r-- 2 user user 162 Jan  2 14:30 sample_hard.txt

This is sample data for understanding Linux links and disk usage.
It contains multiple lines of text.
We will use this file to demonstrate hard and soft links.
```

### Screenshot: `Screenshots/09_link_deletion.png`

---

## 10. Disk Utility Demonstration

### Commands:
```bash
# du command demonstrations
du -h ~ | head -10
du -sh ~
du -ah ~ | head -10
du -h --max-depth=1 ~ | sort -hr | head -10

# df command demonstrations
df -h
df -T
df -i
df -h .
```

### Explanation:
I demonstrated various options for `du` and `df` commands. The `du` command shows disk usage of directories: `-h` for human-readable, `-s` for summary, `-a` to include files, and `--max-depth=1` to limit subdirectory depth. The `df` command displays filesystem information: `-h` shows available space in readable format, `-T` displays filesystem types (ext4, tmpfs, etc.), `-i` shows inode usage, and `df -h .` shows the filesystem containing the current directory. These tools are essential for monitoring disk space and preventing storage issues.

### Expected Output:
```
du -sh output:
150M	/home/user

df -h output:
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1       100G   45G   50G  48% /
tmpfs           3.9G  1.2M  3.9G   1% /run
...

df -T output:
Filesystem     Type     Size  Used Avail Use% Mounted on
/dev/sda1      ext4     100G   45G   50G  48% /
tmpfs          tmpfs    3.9G  1.2M  3.9G   1% /run
...

df -i output:
Filesystem      Inodes  IUsed   IFree IUse% Mounted on
/dev/sda1      6553600 245000 6308600    4% /
...
```

### Screenshot: `Screenshots/10_disk_utilities.png`

---

## Files Created
- `sample_data.txt` - Original file with sample text
- `sample_hard.txt` - Hard link to sample_data.txt (shares same inode)
- `sample_soft.txt` - Symbolic link to sample_data.txt (deleted in task 9)

## Summary
Successfully completed all tasks related to file links and disk usage management. Demonstrated the difference between hard links (same inode) and symbolic links (different inode), verified file metadata, and utilized disk usage commands (`du` and `df`) with various options to monitor storage consumption. Confirmed that deleting a symbolic link does not affect the original file.