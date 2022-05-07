#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

function safely_point_to_new_dotfile {
  local BASENAME=$1
  local DOTFILE=$HOME/$BASENAME
  local CHECKED_IN_DOTFILE=$SCRIPT_DIR/$BASENAME

  # backup old dotfile
  if test -f "$DOTFILE"; then
    mv "$DOTFILE" "$DOTFILE.original"
  fi

  # make a local file in the home directory
  touch "$DOTFILE.local"

  # symlink checked in dotfile to the home directory
  ln -sv $CHECKED_IN_DOTFILE $DOTFILE
}

function setup_preferred_hostname {
  echo What hostname would you like to use for this machine?
  read hostname
  echo "export PREFERRED_HOSTNAME=$hostname" >> $HOME/.bashrc.local
}

echo "=== Creating empty local versions of dotfiles and backing up old ones"
safely_point_to_new_dotfile .bash_login
safely_point_to_new_dotfile .bash_profile
safely_point_to_new_dotfile .bashrc
safely_point_to_new_dotfile .bash_aliases
safely_point_to_new_dotfile .inputrc
safely_point_to_new_dotfile .bash_logout

setup_preferred_hostname

echo "=== Setting up tmux"
safely_point_to_new_dotfile .tmux.conf
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

echo "=== Setup complete"
