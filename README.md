# KeePassXC Secure Vault

This repository is used to securely store and version-control the latest KeePassXC database (`Passwords.kdbx`).

## Features

- Automatically commits and pushes the latest KeePassXC database to a private Git repository.
- Ensures the most recent password database is backed up.
- Can be automated using a cron job or systemd timer.

## How to Use

### 1. **Setup**

Clone this repository (if not already):

```sh
git clone git@github.com:MajesticMinhaz/KeePassXC-Secure-Vault.git && cd KeePassXC-Secure-Vault/
```

Place your KeePassXC database (`Passwords.kdbx`) inside this directory.

### 2. **Run the Backup Script**
Before running, ensure the script has execute permissions and to update and push the latest KeePassXC database run:
```sh
chmod +x update_keepass.sh && ./update_keepass.sh
```

This will:\
✅ Copy the latest database from `~/Documents/Passwords.kdbx`\
✅ Check for changes\
✅ Commit and push the update

### 3. **Automate with Cron (Optional)**

To run the backup script daily at 10 PM, add this to your crontab:

```sh
crontab -e  
```

Then add:

```sh
0 22 * * * /home/minhaz/keepassxc-secure-vault/update_keepass.sh  
```

### 4. **Restore the Database**

If you need to restore your database on another device:

```sh
git clone git@github.com:MajesticMinhaz/KeePassXC-Secure-Vault.git && cd KeePassXC-Secure-Vault/ && cp ./Passwords.kdbx ~/Documents/
```

## Security Notes

- Ensure this repository is **private** to protect your encrypted database.
- Your KeePassXC master password is required to open the database.

🚀 **Now your KeePassXC database is safely backed up and version-controlled!**
