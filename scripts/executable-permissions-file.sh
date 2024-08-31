#!/bin/bash
# Idea:
# 
# - We need to know, what file/pathfile it is
# - We need to know what user does this, must enter sudo password, if not sudo, refuse
# - Modify
# 1. Give permissions to folder or file for docker executability 

# -ne === not equal
if [ "$EUID" -ne 0 ]; then
    echo "We need to run the script with SUDO or Root"
    exit 1
fi

echo "Enter a username"
read username
# >/dev/null redirects the command standard output to the null device, which is a special device which discards the information written to it
# 2>&1 redirects the standard error stream to the standard output stream (stderr = 2, stdout = 1). Note that this takes the standard error stream and points it to same location as standard output at that moment. 
if ! id "$username" &>/dev/null; then
    echo "User '$username' not found"
    exit 1
fi

echo "Enter the filepath"
read filepath

if [ ! -e "$filepath" ]; then
    echo "Path not found"
    exit 1
fi

chown "$username" "$filepath"
chmod +1550 "$filepath" #can't delete, can read/exec user&group, other don't
# -d === if directory , -R
if [ -d "$filepath" ]; then
    chmod -R +1550 "$filepath"
fi

echo "Permissions for execution granted for '$username' & his group"