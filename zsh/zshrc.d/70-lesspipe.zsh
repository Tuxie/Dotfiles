if (( $+commands[lesspipe] )); then
  eval "$(lesspipe)"
elif [[ -f /opt/homebrew/bin/lesspipe.sh ]]; then
  export LESSOPEN="|/opt/homebrew/bin/lesspipe.sh %s"
elif (( $+commands[lesspipe.sh] )); then
  eval "$(lesspipe.sh)"
fi
