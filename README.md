Auto Dashboard Setup (Debian Preseed)
=====================================

Overview
--------

This script is designed to run automatically as the final step in an unattended Debian installation. It sets up a Homer dashboard and prepares the system for immediate use. It is intended to be executed in a root environment and should not be run or modified manually.

Features
--------

- Installs required packages: wget, unzip, nginx, openssh-server
- Enables and starts SSH and Nginx services
- Configures Nginx to serve the Homer dashboard at /var/www/html
- Downloads and extracts the latest Homer release
- Sets appropriate file permissions
- Reloads Nginx to apply configuration changes

Directory Structure
-------------------

- /home/pyro/automate/dashboard – dashboard files and assets
- /var/www/html – symlink pointing to the dashboard folder

Notes
-----

- The script replaces the default Nginx site configuration
- The dashboard configuration is initialized from assets/config.yml.dist
- Designed for unattended execution; no manual intervention is needed
- After completion, the system is ready with the dashboard deployed

Usage
-----

- Automatically executed by the preseed file during Debian installation
- Runs in a root environment, installs, configures, and applies all settings
- Once finished, the system reboots and the Homer dashboard is live
