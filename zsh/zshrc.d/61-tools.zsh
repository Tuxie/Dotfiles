alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# Instead of checking the terminal's capabilities like sane programs,
# Viuer, which is used by spotify_player, checks for a hardcoded set of $TERM
# values or if $TERM_PROGRAM is "MacTerm" to determine if it supports
# sixel (for displaying album art graphics in the terminal).
# https://github.com/atanunq/viuer/blob/master/src/printer/sixel.rs#L85
alias spotify_player="TERM_PROGRAM=MacTerm command spotify_player; fixterm"

# Make less handle compressed files and more
if (( $+commands[lesspipe] )); then
  eval "$(lesspipe)"
elif (( $+commands[lesspipe.sh] )); then
  eval "$(lesspipe.sh)"
fi
