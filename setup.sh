#!/usr/bin/env bash

# Exit on errors, unset variables, or pipeline failures
set -euxo pipefail

# Function to check if a directory exists and move it to a backup location
move_if_exists() {
    local dir=$1
    local backup_dir=$2
    if [ -d "$dir" ]; then
        echo "Moving $dir to $backup_dir"
        mv "$dir" "$backup_dir" || { echo "Failed to move $dir"; exit 1; }
    else
        echo "Directory $dir does not exist. Skipping."
    fi
}

# Check if .dotfiles directory exists
if [ ! -d "$HOME/.dotfiles" ]; then
    echo "Error: $HOME/.dotfiles directory does not exist."
    exit 1
fi

# Create symlinks safely, and handle errors if things go wrong
create_symlink() {
    local target=$1
    local link_name=$2
    if [ -d "$target" ]; then
        ln -sfn "$target" "$link_name" || { echo "Failed to create symlink from $target to $link_name"; exit 1; }
        echo "Created symlink: $link_name -> $target"
    else
        echo "Warning: Target $target does not exist. Skipping symlink creation."
    fi
}

# Backup and create symlinks for .config
move_if_exists "$HOME/.config" "/tmp/.config.backup"
create_symlink "$HOME/.dotfiles/.config" "$HOME/.config"

# Backup and create symlinks for .flox
move_if_exists "$HOME/.flox" "/tmp/.flox.backup"
create_symlink "$HOME/.dotfiles/.flox" "$HOME/.flox"

echo "Setup complete!"

