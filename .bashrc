export PS1='\[\e[0;32m\]\u@\h\[\e[m\]:\[\e[0;34m\]\w\[\e[m\]\$ '

export HISTFILE=~/.bash_history
export HISTSIZE=5000
export HISTFILESIZE=5000
export HISTCONTROL=ignorespace:erasedups
shopt -s histappend

alias ls='ls -G'
alias ll='ls -aFhl'
alias la='ls -A'
alias l='ls -CF'

alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

HOMEBREW_PREFIX="$(brew --prefix 2>/dev/null)"
[ -r "$HOMEBREW_PREFIX/etc/bash_completion" ] && . "$HOMEBREW_PREFIX/etc/bash_completion"

[ -r ~/.profile ] && . ~/.profile
