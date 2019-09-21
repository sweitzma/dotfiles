# Better shell command defaults
alias ls='ls -G'

# Bash Configuration
alias bash_aliases='vim ~/.bash_aliases.local'
alias vimrc='vim ~/.vim/vimrc'
alias ltmuxrc='vim ~/.tmux.conf.local'
alias lbash_aliases='vim ~/.bash_aliases.local'
alias lvimrc='vim ~/.vim/vimrc.local'

# Git
alias irebase='git rebase -i HEAD~10'
alias mrebase='git rebase master'

# Vim and File Editing
function vf {
  if [ -z "$1" ]
  then
    export LAST_FILE=$(fzf -i --height 40%)
  else
    # if we pass in some command line arguments then we should strip spaces and underscores
    echo $(echo $* | sed 's/ //g' | sed 's/_//g')
    export LAST_FILE=$(fzf -i --height 40% -q $(echo $* | sed 's/ //g' | sed 's/_//g'))
  fi
  vim $LAST_FILE
}
alias vi='vim'
alias vl='vim $LAST_FILE'
alias elf='echo $LAST_FILE'

if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi

