#!/bin/bash

# Question 2: File and Directory Management
# Junior System Administrator - Project Organization Task

echo "=========================================="
echo "1. Project Workspace Setup"
echo "=========================================="
cd ~
mkdir documents
ls -ld documents
echo ""

echo "=========================================="
echo "2. File Creation"
echo "=========================================="
cd documents
touch plan.txt
ls -l plan.txt
echo ""

echo "=========================================="
echo "3. Content Addition"
echo "=========================================="
echo "Project Plan - Phase 1" > plan.txt
echo "Task 1: Setup development environment" >> plan.txt
echo "Task 2: Review project requirements" >> plan.txt
echo "Task 3: Create initial documentation" >> plan.txt
echo "Deadline: End of Sprint 1" >> plan.txt
cat plan.txt
echo ""

echo "=========================================="
echo "4. File Metadata Verification"
echo "=========================================="
ls -l plan.txt
echo ""

echo "=========================================="
echo "5. File Duplication"
echo "=========================================="
cp plan.txt plan_copy.txt
ls -l
echo ""

echo "=========================================="
echo "6. Directory Renaming"
echo "=========================================="
cd ~
mv documents project_documents
ls -ld project_documents
echo ""

echo "=========================================="
echo "7. Archival Structure"
echo "=========================================="
cd project_documents
mkdir archive
ls -ld archive
echo ""

echo "=========================================="
echo "8. File Organization"
echo "=========================================="
mv plan_copy.txt archive/
ls -l archive/
echo ""

echo "=========================================="
echo "9. Recursive Listing"
echo "=========================================="
cd ~/project_documents
ls -R
# Alternative with tree structure (if tree command is available):
# tree
echo ""

echo "=========================================="
echo "10. Path Verification"
echo "=========================================="
realpath archive/plan_copy.txt
echo ""

echo "=========================================="
echo "Final Directory Structure:"
echo "=========================================="
cd ~
find project_documents -type f -o -type d
echo ""


echo "Copying all Created Directories and Files from home"  # because the current dir and home dir is different
cp -r ~/* .
