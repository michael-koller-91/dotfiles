# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=1000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/miko/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vim='nvim'

