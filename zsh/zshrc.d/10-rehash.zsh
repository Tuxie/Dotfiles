function __rehash_after_pkg_manager {
    local last_cmd=${history[$((HISTCMD - 1))]}

    if [[ $last_cmd =~ brew.*(install|link|upgrade) ]] \
    || [[ $last_cmd == pacman* ]] \
    || [[ $last_cmd == sudo*pacman* ]] \
    || [[ $last_cmd == apt* ]] \
    || [[ $last_cmd == sudo*apt* ]]
    then
        hash -r
    fi
}

precmd_functions+=(__rehash_after_pkg_manager)
