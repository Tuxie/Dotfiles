# Create global list __sourced, prepopulated with this file
typeset -gA __sourced=("${${(%):-%x}:A}" 1)

source_once() {
    if [[ $__sourced[${1:A}] ]]; then
        return 0
    else
        __sourced[${1:A}]=1
        source "${1:A}"
    fi
}

source_if_exists() {
    if [[ -f $1 ]]; then
        source_once "$1"
    fi
}
