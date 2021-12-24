# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoredups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#####################################
#  configurations
#####################################

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# [Host]: ~/path/to/pwd (git branch) -
#  $ <prompt>

: ${MYHOSTNAME:=$HOSTNAME}

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
      EXIT_STATUS="${BRed}-${RCol}"
    else
      EXIT_STATUS="${BGre}-${RCol}"
    fi

    PS1=""
    PS1+="${Blu}[$MYHOSTNAME]"
    PS1+="${RCol}: "
    PS1+="${Gre}\w"
    PS1+="${Yel} $(parse_git_branch)"
    PS1+=" $EXIT_STATUS$EXIT_STATUS$EXIT_STATUS"
    PS1+="${RCol}\n $ "
}

export FZF_DEFAULT_COMMAND='fd --type f --no-ignore-vcs -H'
export AWS_PROFILE=strln

# Bash completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Autojump
[[ -s /Users/samweitzman/.autojump/etc/profile.d/autojump.sh ]] && source /Users/samweitzman/.autojump/etc/profile.d/autojump.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source ~/.bashrc.local

