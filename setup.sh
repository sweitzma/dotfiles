#!/bin/bash

echo "=== Setting up tmux"
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

echo "=== Setting up vim"
./.vim/vim_setup.sh

echo "=== Creating empty local versions of dotfiles"
touch $HOME/.bashrc.local
touch $HOME/.bash_aliases.local
touch $HOME/.bash_login.local
touch $HOME/.bash_logout.local
touch $HOME/.bash_profile.local
touch $HOME/.inputrc.local
touch $HOME/.vim/vimrc.local
touch $HOME/.tmux.conf.local

# Okay this is the riskier part
echo "=== Skipping any symlinks"
# ln -sv .bashrc $HOME/.bashrc
# ln -sv .bash_aliases $HOME/.bash_aliases
# ln -sv .bash_login $HOME/.bash_login
# ln -sv .bash_logout $HOME/.bash_logout
# ln -sv .bash_profile $HOME/.bash_profile
# ln -sv .inputrc $HOME/.inputrc
# ln -sv .vim $HOME/.vim
# ln -sv .tmux.conf $HOME/.tmux.conf

echo "=== Setup complete"

