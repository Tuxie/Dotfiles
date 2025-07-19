# This file is always sourced before anything else
# Only setup things wanted in non-interactive sessions

# Set $ZDOTDIR to the full location of this file, symlinks expanded
export ZDOTDIR="${${(%):-%N}:A:h}"

# Set $DOTFILES to the parent directory of $ZDOTDIR
export DOTFILES="${ZDOTDIR:h}"

source      "${ZDOTDIR}/zshrc.d/00-helpers.zsh"
source_once "${ZDOTDIR}/zshrc.d/10-homebrew.zsh"

# We want the final path setup to be sourced again in interactive sessions
source "${ZDOTDIR}/zshrc.d/99-path.zsh"

# Source the user's ~/.zshenv.local if it exists
if [[ -f ~/.zshenv.local ]]; then
   source ~/.zshenv.local
fi
