# Use fzf for history search with C-r

if (( $+commands[fzf] )); then
    eval "$(fzf --zsh)"
fi
