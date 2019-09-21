# Dotfiles

* .tmux.conf
* .bashrc
* .bash_profile
* .bash_login
* .bash_logout
* .profile
* .vim/

## Setting this up
We can use symlinks to keep this all in a git repo but access it in the normal location
```
cd ~
ln -sv ~/dotfiles/.bash_profile
ln -sv ~/dotfiles/.bashrc
ln -sv ~/dotfiles/.vim/
```

## Tmux
Make sure to install the tmux plugin manager
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## TODO
.bashrc could use to be pruned and revisited sometime

It would be nice to add sections and scripts related to homebrew and other command line tools that I use. This would be those like
* fzf
* fd
* homebrew
* ripgrep
* conda


===Brew Casks===
iterm2
notion
sublime-text
visual-studio-code
chrome
spotify
dash
clipy
flux
docker
things

===Brew===

awscli
git
bat
glib
postgresql
python
curl
ripgrep
elasticsearch-full
ruby
fd
kakoune
node
sqlite
tmux
tree
fzf
