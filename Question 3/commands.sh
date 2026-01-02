#!/bin/bash
# Question 3: File Links and Disk Usage Management
# Understanding Linux file system links and disk usage

echo "=========================================="
echo "1. File Creation"
echo "=========================================="
cd ~
echo "This is sample data for understanding Linux links and disk usage." > sample_data.txt
echo "It contains multiple lines of text." >> sample_data.txt
echo "We will use this file to demonstrate hard and soft links." >> sample_data.txt
cat sample_data.txt
echo ""

echo "=========================================="
echo "2. Hard Link Creation"
echo "=========================================="
ln sample_data.txt sample_hard.txt
echo "Hard link created: sample_hard.txt"
ls -l sample_*.txt
echo ""

echo "=========================================="
echo "3. Symbolic Link Creation"
echo "=========================================="
ln -s sample_data.txt sample_soft.txt
echo "Symbolic link created: sample_soft.txt"
ls -l sample_*.txt
echo ""

echo "=========================================="
echo "4. Inode Verification"
echo "=========================================="
ls -i sample_data.txt sample_hard.txt sample_soft.txt
echo ""

echo "=========================================="
echo "5. Inode Analysis"
echo "=========================================="
echo "Displaying detailed inode information:"
stat sample_data.txt sample_hard.txt sample_soft.txt
echo ""
echo "Analysis:"
echo "sample_data.txt and sample_hard.txt share the same inode number"
echo "because a hard link points to the same inode as the original file."
echo "sample_soft.txt has a different inode number because it is a symbolic"
echo "link that points to the filename, not the inode itself."
echo ""

echo "=========================================="
echo "6. File Metadata Inspection"
echo "=========================================="
ls -l sample_data.txt
echo ""
echo "Detailed metadata using stat:"
stat sample_data.txt
echo ""

echo "=========================================="
echo "7. Disk Usage Check"
echo "=========================================="
du -h ~
echo ""
echo "Summary of home directory disk usage:"
du -sh ~
echo ""

echo "=========================================="
echo "8. File Size Overview"
echo "=========================================="
ls -lh ~
echo ""
echo "Alternative view with just filenames and sizes:"
du -h ~ --max-depth=0 2>/dev/null
ls -lhS ~ | head -20
echo ""

echo "=========================================="
echo "9. Link Deletion Test"
echo "=========================================="
echo "Before deletion:"
ls -l sample_*.txt
echo ""
echo "Deleting symbolic link..."
rm sample_soft.txt
echo ""
echo "After deletion:"
ls -l sample_*.txt
echo ""
echo "Verifying original file is intact:"
cat sample_data.txt
echo ""

echo "=========================================="
echo "10. Disk Utility Demonstration"
echo "=========================================="
echo "--- du command demonstrations ---"
echo ""
echo "1. du -h (human-readable sizes):"
du -h ~ | head -10
echo ""
echo "2. du -sh (summary of directory):"
du -sh ~
echo ""
echo "3. du -ah (all files with human-readable sizes):"
du -ah ~ | head -10
echo ""
echo "4. du -h --max-depth=1 (one level deep):"
du -h --max-depth=1 ~ | sort -hr | head -10
echo ""
echo "--- df command demonstrations ---"
echo ""
echo "1. df -h (filesystem usage in human-readable format):"
df -h
echo ""
echo "2. df -T (display filesystem type):"
df -T
echo ""
echo "3. df -i (display inode information):"
df -i
echo ""
echo "4. df -h . (current directory's filesystem):"
df -h .
echo ""

echo "Copying all Created Directories and Files from home"  # because the current dir and home dir is different
cd "/mnt/c/Users/hasna/OneDrive/Desktop/Lab Assignment 1/Question 3"
mkdir copied_from_home
cp -r ~/* copied_from_home/

