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

