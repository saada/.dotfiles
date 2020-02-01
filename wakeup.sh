#!/usr/bin/env bash

# Redirect all output and errors to the log file
echo "" > ~/.wake.log
exec >> ~/.wake.log 2>&1

echo "Woke up at $(date)"
$HOME/.dotfiles/backup.sh
