vim() {
    if (( $+commands[nvim] )); then
        nvim "$@"
    else
        command vim "$@"
    fi
}
