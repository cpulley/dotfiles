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
echo Creating ~/dotfile-backup...
dbd=~/dotfile-backup/$(date +%D-%T)-dotfiles/
mkdir -p $dbd/.config


echo Moving dotfiles to $dbd...

# Move files and folders, ignoring $dfp/config and the setup
# to newly created $dbd
for FILENAME in $(ls $dfp | grep -v config | grep -v Dotfile)
do
  if [ -a ~/.$FILENAME ]; then
    echo "Moving .$FILENAME"
    mv ~/.$FILENAME $dbd
  elif [ -h ~/.$FILENAME ]; then
    echo "Removing symlink .$FILENAME"
    rm ~/.$FILENAME
  fi
done

echo
echo "Moving folders from $XDG_CONFIG_HOME to $dbd/.config"

# Move files from XDG_CONFIG_HOME to $dbd/.config
# This is probably terrible in some way I don't understand.
for FILENAME in $(ls $dfp/config)
do
  if [ -a $XDG_CONFIG_HOME/$FILENAME ]; then
    echo "Moving $XDG_CONFIG_HOME/$FILENAME"
    mv $XDG_CONFIG_HOME/$FILENAME $dbd/.config/
  elif [ -h $XDG_CONFIG_HOME/$FILENAME ]; then
    echo "Removing symlink $XDG_CONFIG_HOME/$FILENAME"
    rm $XDG_CONFIG_HOME/$FILENAME
  fi
done

echo
echo Linking...

for FILENAME in $(ls $dfp | grep -v config | grep -v Dotfile)
do
  ln -s $dfp/$FILENAME ~/.$FILENAME
done

mkdir -p $XDG_CONFIG_HOME

for FILENAME in $(ls $dfp/config)
do
  ln -s $dfp/config/$FILENAME $XDG_CONFIG_HOME/$FILENAME
done

echo Done!
