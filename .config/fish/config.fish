## secrets
source ~/.secrets.fish

# brew
fish_add_path /opt/homebrew/bin

# flox
flox activate -m run -d $HOME | source

# zoxide
zoxide init fish | source

# starship
starship init fish | source

# python bins
fish_add_path ~/Library/Python/2.7/bin/

# krew
fish_add_path $HOME/.krew/bin

# direnv
direnv hook fish | source

# go bins
fish_add_path $HOME/go/bin

# ruby
fish_add_path /opt/homebrew/opt/ruby/bin

# rust
fish_add_path $HOME/.cargo/bin
set -gx CARGO_NET_GIT_FETCH_WITH_CLI true

# flutter
fish_add_path $HOME/Downloads/flutter/bin

# bats bins
fish_add_path /usr/local/libexec

set -gx EDITOR "hx"
set -gx DOCKER_IO_USER saada

# AWS
set -gx AWS_PROFILE default
set -gx AWS_DEFAULT_REGION us-east-1

# bun
export BUN_INSTALL="$HOME/.bun"
fish_add_path $BUN_INSTALL/bin

# react native android simulator
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME="$HOME/Library/Android/sdk"
fish_add_path $ANDROID_HOME/emulator
fish_add_path $ANDROID_HOME/platform-tools
