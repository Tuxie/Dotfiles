source $ZDOTDIR/addons/ez-compinit/ez-compinit.plugin.zsh

# Enable cursor key selection for command completion
zstyle ':completion:*' menu select

# Enable colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
