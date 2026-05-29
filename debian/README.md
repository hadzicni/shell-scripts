# Debian 13 Post-Installation Scripts

This repository contains post-installation scripts for Debian 13 (Trixie) that automates common setup tasks after a fresh installation.

## Usage Post-Installation Script

```bash
bash -c "$(wget -qO- https://raw.githubusercontent.com/hadzicni/shell-scripts/main/debian/debian13-postinstall.sh)"
```

## After VM Clone
```bash
sudo ssh-keygen -A
sudo systemctl restart ssh
```

## Usage Template Post-Installation Script

```bash
bash -c "$(wget -qO- https://raw.githubusercontent.com/hadzicni/shell-scripts/main/debian/debian13-postinstalltemplate.sh)"
```
