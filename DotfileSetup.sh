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
dbd=~/dotfile-backup/$(date +%y-%m-%d_%T)_dotfiles/
# If date fails somehow, just default to ~/dotfile-backup
if [ $? -ne 0 ]; then
  dbd=~/dotfile-backup/
fi

mkdir -p $dbd/.config

echo "Moving files from $HOME to $dbd..."

# Move files and folders, ignoring $dfp/config and the setup
# to newly created $dbd
for FILENAME in $(ls $dfp | grep -v config | grep -v Dotfile)
do
  if [ -h ~/.$FILENAME ]; then
    echo "Removing symlink .$FILENAME"
    rm ~/.$FILENAME
  elif [ -a ~/.$FILENAME ]; then
    echo "Moving .$FILENAME"
    mv ~/.$FILENAME $dbd
  fi
done

echo
echo "Moving folders from $XDG_CONFIG_HOME to $dbd.config"

# Move files from XDG_CONFIG_HOME to $dbd/.config
# This is probably terrible in some way I don't understand.
for FILENAME in $(ls $dfp/config)
do
  if [ -h $XDG_CONFIG_HOME/$FILENAME ]; then
    echo "Removing symlink $XDG_CONFIG_HOME/$FILENAME"
    rm $XDG_CONFIG_HOME/$FILENAME
  elif [ -a $XDG_CONFIG_HOME/$FILENAME ]; then
    echo "Moving $XDG_CONFIG_HOME/$FILENAME"
    mv $XDG_CONFIG_HOME/$FILENAME $dbd/.config/
  fi
done

# If nothing got copied to the backup dir, go ahead and delete it.
if [ $(du -B 1 $dbd | cut -f 1 | tail -n 1) -le 8192 ]; then
  rm -rf $dbd
  echo
  echo "No backups made! Cleaning up ~/dotfile-backup..."
fi

# Same, but for the whole backup dir
if [ $(du -B 1 ~/dotfile-backup | cut -f 1 | tail -n 1) -le 8192 ]; then
  rm -rf ~/dotfile-backup
fi

echo
echo "Linking..."

for FILENAME in $(ls $dfp | grep -v config | grep -v Dotfile)
do
  echo "Linking $FILENAME to $HOME/.$FILENAME"
  ln -s $dfp/$FILENAME $HOME/.$FILENAME
done

mkdir -p $XDG_CONFIG_HOME

for FILENAME in $(ls $dfp/config)
do
  echo "Linking config/$FILENAME to $XDG_CONFIG_HOME/$FILENAME"
  ln -s $dfp/config/$FILENAME $XDG_CONFIG_HOME/$FILENAME
done

echo "Done!"
