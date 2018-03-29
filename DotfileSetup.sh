#!/bin/bash

### This section is stolen from lytedev's setup script!
### If interested, you can find their dotfiles at github.com/lytedev/dotfiles

if [[ -z "$XDG_CONFIG_HOME" ]]; then
	export XDG_CONFIG_HOME="$HOME/.config"
fi

dfp=$(cd "$(dirname "${BASH_SOURCE[0]}" )/" && pwd)

ALERT_AGREEMENT_FILE="$dfp/.agreed-to-erasing-files.lock"

# Let user know that this script will delete their current configuration and
# that they should read this script before running. We'll use a lock file so
# the user only needs to agree once.
if [ -f "$ALERT_AGREEMENT_FILE" ]; then
  # User agreed already - do nothing
  echo "Linking..."
else
  echo "Running this script may delete existing personal configuration files."
  echo "Please view this script's source, fully understand it, and backup any"
  echo "files before continuing."
  echo "Seriously. Like... entire directories. Just gone."
  read -r -p "Are you sure you want to continue? [y/N] " response
  response=${response,,} # to lower case
  if [[ $response =~ ^(yes|y)$ ]]; then
    echo "agreed" > "$ALERT_AGREEMENT_FILE"
  else
    exit 1
  fi
fi

### End section

echo
echo "Creating ~/dotfile-backup..."
# Use dbd (dotfile backup directory) so we can create new backups per-date
# Honestly, this is my first time trying a script like this, I have no idea
# what dumb accidents might happen. It appears to work on my machine, at least.
# If date fails somehow, just default to ~/dotfile-backup
if ! dbd=~/dotfile-backup/$(date +%y-%m-%d_%T)_dotfiles/; then
  dbd=~/dotfile-backup/
fi

mkdir -p $dbd/.config

echo "Moving files from $HOME to $dbd..."

# Move files and folders, ignoring $dfp/config and the setup
# to newly created $dbd
for FILENAME in $(ls "$dfp" | grep -v config | grep -v Dotfile)
do
  if [ -h "$HOME/.$FILENAME" ]; then
    echo "Removing symlink $HOME/.$FILENAME"
    rm "$HOME/.$FILENAME"
  elif [ -a "$HOME/.$FILENAME" ]; then
    echo "Moving .$FILENAME"
    mv "$HOME/.$FILENAME" "$dbd"
  fi
done

echo
echo "Moving folders from $XDG_CONFIG_HOME to $dbd.config"

# Move files from XDG_CONFIG_HOME to $dbd/.config
# This is probably terrible in some way I don't understand.
for FILENAME in $dfp/config/*
do
  if [ -h "$XDG_CONFIG_HOME/$FILENAME" ]; then
    echo "Removing symlink $XDG_CONFIG_HOME/$FILENAME"
    rm "$XDG_CONFIG_HOME/$FILENAME"
  elif [ -a "$XDG_CONFIG_HOME/$FILENAME" ]; then
    echo "Moving $XDG_CONFIG_HOME/$FILENAME"
    mv "$XDG_CONFIG_HOME/$FILENAME" $dbd/.config/
  fi
done

# If nothing got copied to the backup dir, go ahead and delete it.
if [ "$(du -B 1 $dbd | cut -f 1 | tail -n 1)" -le 8192 ]; then
  rm -rf $dbd
  echo
  echo "No backups made! Cleaning up ~/dotfile-backup..."
fi

# Same, but for the whole backup dir
if [ "$(du -B 1 ~/dotfile-backup | cut -f 1 | tail -n 1)" -le 8192 ]; then
  rm -rf ~/dotfile-backup
fi

echo
echo "Linking..."

for FILENAME in $(ls "$dfp" | grep -v config | grep -v Dotfile)
do
  echo "Linking $FILENAME to $HOME/.$FILENAME"
  ln -s "$dfp/$FILENAME" "$HOME/.$FILENAME"
done

mkdir -p "$XDG_CONFIG_HOME"

for FILENAME in $dfp/config/*
do
  echo "Linking config/$FILENAME to $XDG_CONFIG_HOME/$FILENAME"
  ln -s "$dfp/config/$FILENAME" "$XDG_CONFIG_HOME/$FILENAME"
done


if [ ! -e "$HOME/.zplug" ]; then
  echo 
  read -r -p "Would you like to install the plugin manager (zplug) for zsh? [y/N] " responsezsh
  responsezsh=${responsezsh,,} # to lower case
  if [[ $responsezsh =~ ^(yes|y)$ ]]; then
    git clone https://github.com/zplug/zplug "$HOME/.zplug"
    echo "Open or reopen zsh to finish installation!"
  fi
fi

if [ ! -e "$HOME/.tmux/plugins/tpm" ]; then
  echo
  read -r -p "Would you like to install the plugin manager (tpm) for tmux? [y/N] " responsetmux
  responsetmux=${responsetmux,,} # to lower case
  if [[ $responsetmux =~ ^(yes|y)$ ]]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    echo "Open tmux to finish installation! If you already have a tmux session"
    echo "running, run 'tmux source ~/.tmux.conf'."
  fi
fi
    
if [ ! -e "$HOME/.vim/autoload/plug.vim" ] || [ ! -e "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
  echo
  read -r -p "Would you like to install the plugin manager (vim-plug) for vim and nvim? [y/N] " responsevim
  responsevim=${responsevim,,} # to lower case
  if [[ $responsevim =~ ^(yes|y)$ ]]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "Once vim is open, run :PlugInstall to finish installation!"
  fi
fi

echo "Done!"
