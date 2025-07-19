# Clean up $path

# Expand symlinks, deduplicate and remove non-existing paths
path=(${(u)^path:A}(N-/))

# Add paths that we want to keep no matter what, in case they are created later
path=(
    "$HOME/bin"
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "${GOBIN:-$HOME/.go/bin}"
    $path
)

# Expand symlinks and deduplicate again
path=(${(u)^path:A})
