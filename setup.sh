#!/bin/bash

echo "=== Setting up tmux"
# ln -sv .tmux.conf $HOME/.tmux.conf
touch $HOME/.tmux.conf.local
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

echo "=== Setting up vim"
# Note that we should actually symlink this first before running the vim setup
# ln -sv $HOME/dotfiles/.vim $HOME
touch $HOME/.vim/vimrc.local
./.vim/vim_setup.sh

echo "=== Setting up emacs"
# ln -sv $HOME/dotfiles/.emacs.d $HOME
cp $HOME/dotfiles/.emacs.d/default_local_configuration.org $HOME/.emacs.local.org

echo "=== Creating empty local versions of dotfiles"
touch $HOME/.bashrc.local
touch $HOME/.bash_aliases.local
touch $HOME/.bash_login.local
touch $HOME/.bash_logout.local
touch $HOME/.bash_profile.local
touch $HOME/.inputrc.local

# Okay this is the riskier part
echo "=== Skipping any symlinks"
# ln -sv $HOME/dotfiles/.bashrc $HOME/.bashrc
# ln -sv $HOME/dotfiles/.bash_aliases $HOME/.bash_aliases
# ln -sv $HOME/dotfiles/.bash_login $HOME/.bash_login
# ln -sv $HOME/dotfiles/.bash_logout $HOME/.bash_logout
# ln -sv $HOME/dotfiles/.bash_profile $HOME/.bash_profile
# ln -sv $HOME/dotfiles/.inputrc $HOME/.inputrc

echo "=== Setup complete"

