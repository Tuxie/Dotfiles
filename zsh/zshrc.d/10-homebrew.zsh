path=(
    /opt/homebrew/bin
    /home/linuxbrew/.linuxbrew/bin
    /usr/local/bin
    $path
)

if (( $+commands[brew] )); then
	eval "$(brew shellenv)"

    # Install casks into ~/Applications instead of /Applications
    export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"

    # Let various build environments know where to find build dependencies
    # you have install with Homebrew
    export LIBRARY_PATH="${HOMEBREW_PREFIX}/lib:${LIBRARY_PATH}"
    export C_INCLUDE_PATH="${HOMEBREW_PREFIX}/include:${C_INCLUDE_PATH}"
    export PKG_CONFIG_PATH="${HOMEBREW_PREFIX}/pkgconfig:${PKG_CONFIG_PATH}"
    export LDFLAGS="${HOMEBREW_PREFIX}/lib:${LDFLAGS}"
    export CPPFLAGS="${HOMEBREW_PREFIX}/include:${CPPFLAGS}"
    export DYLD_LIBRARY_PATH="${HOMEBREW_PREFIX}/lib:${DYLD_LIBRARY_PATH}"

    # A little helper to update, upgrade and cleanup Homebrew.
    burp() {
        brew update && brew upgrade && brew cleanup && echo Done.
    }
fi
