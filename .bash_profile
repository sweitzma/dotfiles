parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# [Host]: ~/path/to/pwd (git branch) -
#  $ <prompt>
PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs
__prompt_command() {
    local EXIT="$?" # This needs to be first
    local RCol='\[\e[0m\]'    # reset color
    local BRed='\[\e[1;31m\]' # bright red
    local Gre='\[\e[0;32m\]'  # green
    local BGre='\[\e[1;32m\]' # bright green
    local Yel='\[\e[0;33m\]'  # yellow
    local Blu='\[\e[0;34m\]'  # blue

    if [ $EXIT != 0 ]; then
      EXIT_STATUS=" ${BRed}-${RCol}"
    else
      EXIT_STATUS=" ${BGre}-${RCol}"
    fi

    PS1=""
    PS1+="${Blu}[\h]"
    PS1+="${RCol}: "
    PS1+="${Gre}\w"
    PS1+="${Yel}$(parse_git_branch)"
    PS1+="$EXIT_STATUS"
    PS1+="${RCol}\n $ "
}

export FZF_DEFAULT_COMMAND='fd --type f --no-ignore-vcs'

# PATH variable
export PATH=/bin:$PATH
export PATH=/sbin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# might need to move these to local but we can wait
export PATH=$HOME/.cargo/bin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH

if [ -d "$HOME/local/bin" ] ; then
    PATH="$HOME/local/bin:$PATH"
fi

# Source other files
if test -f '~/.bash_profile.local'; then
  source ~/.bash_profile.local
fi
source ~/.bashrc


