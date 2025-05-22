# KeePassXC Secure Vault

This repository is used to securely store and version-control the latest KeePassXC database (`Passwords.kdbx`).

## Features

- Automatically commits and pushes the latest KeePassXC database to a private Git repository.
- Ensures the most recent password database is backed up.
- Can be automated using a cron job or systemd timer.

## How to Use


### 1. **Restore the Database**

If you need to restore your database:

Change to $HOME to avoid issues if you're inside the KeePassXC-Secure-Vault directory
```bash
cd ~ && \
if [ -d ~/KeePassXC-Secure-Vault ]; then \
    read -p "Directory exists. Overwrite? (y/n): " choice && \
    if [ "$choice" = "y" ]; then \
        rm -rf ~/KeePassXC-Secure-Vault && \
        git clone https://github.com/MajesticMinhaz/KeePassXC-Secure-Vault.git ~/KeePassXC-Secure-Vault && \
        cd ~/KeePassXC-Secure-Vault && \
        git remote set-url origin git@github.com:MajesticMinhaz/KeePassXC-Secure-Vault.git 2>/dev/null || \
        echo -e "\nNOTE: To enable SSH later:\n1. Generate keys: ssh-keygen -t ed25519\n2. Add to GitHub: cat ~/.ssh/id_ed25519.pub\n3. Run: git remote set-url origin git@github.com:MajesticMinhaz/KeePassXC-Secure-Vault.git"; \
    else \
        cd ~/KeePassXC-Secure-Vault && \
        git pull; \
    fi; \
else \
    git clone https://github.com/MajesticMinhaz/KeePassXC-Secure-Vault.git ~/KeePassXC-Secure-Vault && \
    cd ~/KeePassXC-Secure-Vault && \
    git remote set-url origin git@github.com:MajesticMinhaz/KeePassXC-Secure-Vault.git 2>/dev/null || \
    echo -e "\nNOTE: To enable SSH later:\n1. Generate keys: ssh-keygen -t ed25519\n2. Add to GitHub: cat ~/.ssh/id_ed25519.pub\n3. Run: git remote set-url origin git@github.com:MajesticMinhaz/KeePassXC-Secure-Vault.git"; \
fi && \
cd ~/KeePassXC-Secure-Vault && \
cp ./Passwords.kdbx ~/Documents/ 2>/dev/null && \
echo -e "\nSUCCESS:\n- Repo cloned/updated\n- SSH configured (if keys exist)\n- Passwords.kdbx copied to ~/Documents/" || \
echo -e "\nWARNING: Passwords.kdbx not found (but repo is ready)"

```

### 2. **Run the Backup Script**
Before running, ensure the script has execute permissions and to update and push the latest KeePassXC database run:

```bash
~/KeePassXC-Secure-Vault/update_keepass.sh
```

This will:\
✅ Copy the latest database from `~/Documents/Passwords.kdbx`\
✅ Check for changes\
✅ Commit and push the update
