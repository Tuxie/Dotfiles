# Set the final top path order
path=(
    "$HOME/bin"
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "$GOBIN" "$HOME"/{go,.go}/bin
    /usr/local/{bin,sbin}
    "${HOMEBREW_PREFIX:-NOT_EXISTING}"/{bin,sbin}
    /snap/bin
    $path
)

# Expand symlinks, deduplicate and remove non-existing paths
path=(${(u)^path:A}(N-/))
