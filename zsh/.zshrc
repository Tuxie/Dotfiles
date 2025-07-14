# Source all *.zsh files in zshrc.d
for rcfile in $ZDOTDIR/zshrc.d/*.zsh(N); do
    source "$rcfile"
done

# Deduplicate and remove non-existing paths from $path
path=(${(u)^path}(N-/))

# Source the user's own .zshrc if it has one
if [[ -f $HOME/.zshrc ]]; then
    source "$HOME/.zshrc"
fi
