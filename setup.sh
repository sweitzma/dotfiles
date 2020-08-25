#!/bin/bash

function safely_point_to_new_dotfile {
  local BASENAME=$1
  local DOTFILE=$HOME/$BASENAME
  local CHECKED_IN_DOTFILE=$HOME/dotfiles/$BASENAME

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

function setup_preferred_color {
  echo What base color would you like to use for bash prompt and tmux?
  echo 1. Red
  echo 2. Blue
  echo 3. Purple
  echo 4. Cyan
  echo 5. Magenta
  echo 6. Green
  echo 7. Yellow
  echo 8. White
  read color

  echo Sorry this functionality is not supported yet.
}

echo "=== Creating empty local versions of dotfiles and backing up old ones"
safely_point_to_new_dotfile .bash_login
safely_point_to_new_dotfile .bash_profile
safely_point_to_new_dotfile .bashrc
safely_point_to_new_dotfile .bash_aliases
safely_point_to_new_dotfile .inputrc
safely_point_to_new_dotfile .bash_logout

setup_preferred_hostname
setup_preferred_color

echo "=== Setting up tmux"
safely_point_to_new_dotfile .tmux.conf
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

echo "=== Setting up vim"
ln -sv $HOME/dotfiles/.vim $HOME
touch $HOME/.vim/vimrc.local
./.vim/vim_setup.sh

echo "=== Setting up emacs"
ln -sv $HOME/dotfiles/.emacs.d $HOME
cp $HOME/dotfiles/.emacs.d/default_local_configuration.org $HOME/.emacs.local.org

echo "=== Setup complete"
