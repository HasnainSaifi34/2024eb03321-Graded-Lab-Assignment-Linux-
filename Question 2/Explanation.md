# Question 2: File and Directory Management

## Task Overview
As a junior system administrator, I organized project-related files in the home directory demonstrating Linux file and directory management skills.

---

## 1. Project Workspace Setup

### Commands:
```bash
cd ~
mkdir documents
ls -ld documents
```

### Explanation:
I navigated to my home directory using `cd ~` and created a new directory called `documents` using `mkdir`. The `ls -ld` command displayed the directory details with permissions and ownership, confirming the directory was created successfully with default permissions (typically drwxr-xr-x).

### Expected Output:
```
drwxr-xr-x 2 hasna hasna 4096 Jan 02 14:30 documents
```

### Screenshot: `screenshots/01_create_documents.png`

---

## 2. File Creation

### Commands:
```bash
cd documents
touch plan.txt
ls -l plan.txt
```

### Explanation:
I changed into the `documents` directory using `cd` and created an empty file named `plan.txt` using the `touch` command. The `ls -l` command verified the file was created with the current timestamp and showed its initial size of 0 bytes before adding content.

### Expected Output:
```
-rw-r--r-- 1 hasna hasna 0 Jan 02 14:31 plan.txt
```

### Screenshot: `screenshots/02_create_plan_file.png`

---

## 3. Content Addition

### Commands:
```bash
echo "Project Plan - Phase 1" > plan.txt
echo "Task 1: Setup development environment" >> plan.txt
echo "Task 2: Review project requirements" >> plan.txt
echo "Task 3: Create initial documentation" >> plan.txt
echo "Deadline: End of Sprint 1" >> plan.txt
cat plan.txt
```

### Explanation:
I used `echo` with output redirection (`>` for first line, `>>` for appending) to write project planning content into `plan.txt`. The `cat` command displayed the file contents to verify all lines were written successfully. This demonstrates both file overwriting (`>`) and appending (`>>`) operations.

### Expected Output:
```
Project Plan - Phase 1
Task 1: Setup development environment
Task 2: Review project requirements
Task 3: Create initial documentation
Deadline: End of Sprint 1
```

### Screenshot: `screenshots/03_add_content.png`

---

## 4. File Metadata Verification

### Command:
```bash
ls -l plan.txt
```

### Explanation:
I executed `ls -l` to display detailed file metadata including permissions (-rw-r--r--), ownership (my username), group, file size (now larger after adding content), and modification timestamp. This confirms the file is owned by my user account and has standard read/write permissions for the owner.

### Expected Output:
```
-rw-r--r-- 1 hasna hasna 156 Jan 02 14:32 plan.txt
```

### Screenshot: `screenshots/04_file_metadata.png`

---

## 5. File Duplication

### Commands:
```bash
cp plan.txt plan_copy.txt
ls -l
```

### Explanation:
I used the `cp` (copy) command to create a duplicate of `plan.txt` named `plan_copy.txt`. The `ls -l` command showed both files now exist in the directory with identical sizes and content, but `plan_copy.txt` has a newer timestamp reflecting when it was created.

### Expected Output:
```
-rw-r--r-- 1 hasna hasna 156 Jan 02 14:32 plan.txt
-rw-r--r-- 1 hasna hasna 156 Jan 02 14:33 plan_copy.txt
```

### Screenshot: `screenshots/05_file_copy.png`

---

## 6. Directory Renaming

### Commands:
```bash
cd ~
mv documents project_documents
ls -ld project_documents
```

### Explanation:
I returned to the home directory and used `mv` (move) to rename the `documents` directory to `project_documents`. The `mv` command works for both moving and renaming files/directories. The `ls -ld` confirmed the directory now has the new name while preserving all its contents.

### Expected Output:
```
drwxr-xr-x 2 hasna hasna 4096 Jan 02 14:33 project_documents
```

### Screenshot: `screenshots/06_rename_directory.png`

---

## 7. Archival Structure

### Commands:
```bash
cd project_documents
mkdir archive
ls -ld archive
```

### Explanation:
I navigated into `project_documents` and created a subdirectory named `archive` using `mkdir`. This creates a nested directory structure for organizing older or backup files. The `ls -ld` command verified the subdirectory was created with appropriate permissions.

### Expected Output:
```
drwxr-xr-x 2 hasna hasna 4096 Jan 02 14:34 archive
```

### Screenshot: `screenshots/07_create_archive.png`

---

## 8. File Organization

### Commands:
```bash
mv plan_copy.txt archive/
ls -l archive/
```

### Explanation:
I used `mv` to move `plan_copy.txt` into the `archive` subdirectory, organizing the backup file separately from the working file. The `ls -l archive/` command confirmed the file is now located inside the archive directory and no longer in the parent directory.

### Expected Output:
```
-rw-r--r-- 1 hasna hasna 156 Jan 02 14:33 plan_copy.txt
```

### Screenshot: `screenshots/08_move_to_archive.png`

---

## 9. Recursive Listing

### Commands:
```bash
cd ~/project_documents
ls -R
```

### Explanation:
I executed `ls -R` (recursive list) from the `project_documents` directory to display all files and subdirectories in a hierarchical view. This shows the complete directory structure including the `archive` subdirectory and its contents, giving a clear overview of the entire project organization.

### Expected Output:
```
.:
archive  plan.txt

./archive:
plan_copy.txt
```

### Screenshot: `screenshots/09_recursive_listing.png`

---

## 10. Path Verification

### Command:
```bash
readlink -f archive/plan_copy.txt
```
or
```bash
realpath archive/plan_copy.txt
```

### Explanation:
I used `readlink -f` to display the absolute (full) path of `plan_copy.txt` from the root directory. This shows the complete location of the file in the filesystem hierarchy, starting from `/` and including all parent directories. This is useful for scripts and ensuring correct file references.

### Expected Output:
```
/home/hasna/project_documents/archive/plan_copy.txt
```

### Screenshot: `screenshots/10_absolute_path.png`

---

## Final Directory Structure

```
~/project_documents/
├── plan.txt
└── archive/
    └── plan_copy.txt
```

## Files Created
- `plan.txt` - Original project plan file
- `plan_copy.txt` - Backup copy in archive directory

## Summary
Successfully organized project files by creating directories, managing files, and establishing a logical archival structure. All file operations completed with proper permissions and ownership verification.