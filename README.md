# My dotfiles

Setup my dotfiles

```sh
cd ~
git clone git@github.com:saada/.dotfiles.git
cd .dotfiles
./setup.sh # sets up symlinks
# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# install brew packages
brew bundle --file=~/.dotfiles/Brewfile
# install flox packages
flox edit # should install everything after making any whitespace change
# git settings
## git config user info
## git config --global user.name
## git config --global user.email
git config --global alias.up 'pull --rebase --autostash'
git config --global --add --bool push.autoSetupRemote true
git config --global init.defaultBranch main
git config --global push.autosetupremote true
```

Download and install FiraCode Nerd font: https://www.nerdfonts.com/font-downloads

Secrets can be setup by

```sh
cp .secrets.example.fish ~/.secrets.fish
```

Backup my dotfiles

```sh
./backup.sh
```

Automatically run backups on wakeup

```sh
ln -sfn $HOME/.dotfiles/wakeup.sh $HOME/.wakeup
brew services start sleepwatcher
```

## Todos

- [ ] Migrate all possible `brew leaves` packages to `flox`
- [ ] Get zoxide to replace cd
