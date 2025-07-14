function rehash_after_pkg_manager {
    local last_cmd=${history[$((HISTCMD - 1))]}

    if [[ $last_cmd == pacman* ]] \
    || [[ $last_cmd =~ brew.*(install|link|upgrade) ]] \
    || [[ $last_cmd == apt* ]]
    then
        hash -r
    fi
}

precmd_functions+=(rehash_after_pkg_manager)
