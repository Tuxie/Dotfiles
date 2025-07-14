# This file is always sourced before anything else

# Set $ZDOTDIR to the full location of this file, symlinks expanded
export ZDOTDIR="${${(%):-%N}:A:h}"

# Set $DOTFILES to the parent directory of $ZDOTDIR
export DOTFILES="${ZDOTDIR:h}"

# Where can we possibly find Homebrew?
path=(
    $HOME/bin
    $HOME/.local/bin
    /opt/homebrew/bin
    /home/linuxbrew/.linuxbrew/bin
    /usr/local/bin
    $path
)

# Setup Homebrew if it's installed
if (( $+commands[brew] )); then
    # Install casks into ~/Applications instead of /Applications
    export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"

	eval "$(brew shellenv)"
fi

if [[ -f ~/.zshenv.local ]]; then
   source ~/.zshenv.local
fi

# Deduplicate and remove non-existing paths from $path
path=(${(u)^path}(N-/))
