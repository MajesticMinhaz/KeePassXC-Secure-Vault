#!/bin/bash

# Set the path to your KeePassXC database in /mnt/backup/KeePassXC/
DB_PATH="$HOME/KeePassXC/Passwords.kdbx"  # Change this if needed

# Set the path to the backup location where the Git repository is located
REPO_PATH="."  # Current directory (can be changed to the actual repo path)

# Copy the latest KeePassXC database to the current Git repository
cp "$DB_PATH" "$REPO_PATH/Passwords.kdbx"

# Change to the Git repository directory (if needed)
cd "$REPO_PATH"

# Check if there are any changes
if git diff --quiet && git diff --staged --quiet; then
    echo "No changes detected in KeePassXC database."
    exit 0
fi

# Add, commit, and push changes
git add Passwords.kdbx
git commit -m "Updated KeePassXC database on $(date +'%Y-%m-%d %H:%M:%S')"
git push origin master  # Change 'main' if your branch name is different

echo "KeePassXC database successfully backed up to Git."
