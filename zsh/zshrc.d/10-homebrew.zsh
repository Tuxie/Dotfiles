path=(
    /opt/homebrew/bin
    /home/linuxbrew/.linuxbrew/bin
    /usr/local/bin
    $path
)

if (( $+commands[brew] )); then
    # Install casks into ~/Applications instead of /Applications
    export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"

	eval "$(brew shellenv)"

    # Make brew update the cached $PATH after changes
#    function brew {
#	    command brew "$@"
#	    RC=$?
#	    [[ "$@" =~ 'install|upgrade|link' ]] && hash -r
#	    return $RC
#    }

    function burp {
        brew update && brew upgrade && brew cleanup && echo Done.
    }
fi
