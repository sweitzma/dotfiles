# PATH variable
export PATH=/bin:$PATH
export PATH=/sbin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

if [ -d "$HOME/local/bin" ] ; then
  export PATH="$HOME/local/bin:$PATH"
fi

# Source other files
if test -f "$HOME/.bash_profile.local"; then
  source $HOME/.bash_profile.local
fi

source ~/.bashrc
