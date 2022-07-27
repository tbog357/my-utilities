#!/bin/bash
# Remove no longer required package
apt-get autoremove

# Clean up apt cache
apt-get clean

# Clear systemd journal logs
journalctl --vacuum-time=3d

# Clear the thumbnail
rm -rf ~/.cache/thumbnails/*
 
# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done