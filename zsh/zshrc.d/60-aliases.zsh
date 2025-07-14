if [[ $OSTYPE == darwin* ]]; then
    # Use GNU ls on macOS if coreutils is installed,
    # mainly because it supports $LS_COLORS
    if (( $+commands[gls] )); then
        alias ls='gls --color=auto'
    else
        alias ls='ls -G'
    fi
else
    alias ls='ls --color=auto'
fi

alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias bat='bat -pp'
alias bore='bat'
