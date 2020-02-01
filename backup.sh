#!/usr/bin/env bash
set -euxo pipefail

PATH=/usr/local/bin:$PATH
PATH=/opt/homebrew/bin:$PATH

dir=$(dirname $0)

echo "🚀 Backing up dotfiles"
mv $dir/Brewfile /tmp/
brew bundle dump --all --file $dir/Brewfile
git -C $dir add .
git -C $dir commit -m "backup - $(date '+%D %r')"
git -C $dir push
echo "🎉 Backup complete"
