# grc adds colors to many common tools
if [[ -f /opt/homebrew/etc/grc.zsh ]]; then
    source /opt/homebrew/etc/grc.zsh
elif [[ -f /etc/grc.zsh ]]; then
    source /etc/grc.zsh
elif [[ -f /home/linuxbrew/.linuxbrew/etc/grc.zsh ]]; then
    source /home/linuxbrew/.linuxbrew/etc/grc.zsh
fi

if [[ $OSTYPE == linux-gnu ]]; then
    alias ls='ls --color=auto'
fi

export CLICOLORS=1
export GCC_COLORS=1

export BAT_STYLE=plain
export BAT_PAGING=never
export BAT_THEME='Coldark-Dark'

# It's sometimes called bat and sometimes batcat
if (( $+commands[bat] && ! $+commands[batcat] )); then
  alias bat='command bat --color=always'
  alias batcat='command bat --color=auto'
elif (( $+commands[batcat] && ! $+commands[bat] )); then
  alias bat='command batcat --color=always'
  alias batcat='command batcat --color=auto'
fi
alias bore='command bat --paging=auto'
