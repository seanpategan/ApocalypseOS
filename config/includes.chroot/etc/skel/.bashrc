# ~/.bashrc — ApocalypseOS default shell configuration

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend

# Window size
shopt -s checkwinsize

# Prompt
PS1='\[\033[1;32m\][ApocalypseOS]\[\033[0m\] \[\033[1;34m\]\w\[\033[0m\]\$ '

# Aliases
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'

# ApocalypseOS shortcuts
alias guides='apos-guides'
alias backup='sudo apos-backup'
alias lockdown='sudo apos-lockdown'

# Welcome message (first terminal only)
if [ -z "$APOS_WELCOMED" ]; then
    export APOS_WELCOMED=1
    echo ""
    echo "  ApocalypseOS — Secure. Offline. Resilient."
    echo "  Type 'guides' to open offline coding documentation."
    echo "  Type 'ollama run <model>' to chat with local AI."
    echo ""
fi
