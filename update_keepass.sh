#!/bin/bash

# Set the path to your KeePassXC database
DB_PATH="$HOME/Documents/Passwords.kdbx"  # Change this if needed

# Copy the latest KeePassXC database to the current Git repository
cp "$DB_PATH" "./Passwords.kdbx"

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
