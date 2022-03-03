# Shell navigation
alias pd='pushd .'

# Git
alias irebase='git rebase -i HEAD~10'

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
  nvim $LAST_FILE
}

alias vi='nvim'
alias vl='nvim $LAST_FILE'
alias elf='echo $LAST_FILE'

if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi
