if [[ -f /opt/homebrew/etc/grc.zsh ]]; then
    source /opt/homebrew/etc/grc.zsh
elif [[ -f /etc/grc.zsh ]]; then
    source /etc/grc.zsh
elif [[ -f /home/linuxbrew/.linuxbrew/etc/grc.zsh ]]; then
    source /home/linuxbrew/.linuxbrew/etc/grc.zsh
fi
