#!/usr/bin/env zsh

autoload -Uz is-at-least
if ! is-at-least 5.9; then
    print "Only ZSH v5.9 and newer is supported! You have v${ZSH_VERSION}"
    print "Exiting."
    exit 1
fi

# The full path to the directory containing this file, symlinks expanded
export DOTFILES="${${(%):-%N}:A:h}"

# Paths to look for stuff during the installation
path=(
    $HOME/bin
    $HOME/.local/bin
    /opt/homebrew/bin
    /opt/homebrew/opt/ruby/bin
    /home/linuxbrew/.linuxbrew/bin
    /home/linuxbrew/.linuxbrew/opt/ruby/bin
    /usr/local/bin
    $path
)

recommended=(
    git
    fzf
    tmux
    jq
    rg:ripgrep
    ruby
    irb
    vivid
    bat
    nvim:neovim
    grc
    pspg
)

if [[ $OSTYPE == darwin* ]]; then
    if (( ! $+commands[brew] )); then
        print "Homebrew is required on macOS! Please install it: https://brew.sh"
        exit 1
    fi
fi

missing=()
for tool in "${recommended[@]}"
do
    if (( ! $+commands[${tool%%:*}] )); then
        missing+=(${tool#*:})
    fi
done
if (( ${#missing[@]} )); then
    print "Some packages are missing. Install them:"
    if (( $+commands[pacman] )); then
        print "  sudo pacman -Sy ${(ou)missing[@]}"
    elif (( $+commands[brew] )); then
        print "  brew install ${(ou)missing[@]}"
    elif (( $+commands[apt-get] )); then
        print "  sudo apt install ${(ou)missing[@]}"
    elif (( $+commands[dnf] )); then
        print "  sudo dnf install ${(ou)missing[@]}"
    else
        print "  ${(ou)missing[@]}"
    fi
    exit 1
fi

# Fetch or update the zsh addons
cd "$DOTFILES"
git submodule update --init --remote --merge --recursive
cd ~

_mkzshenv() {
    print "# This file will be overwritten!"
    print "# Make additions to ~/.zshenv.local instead."
    print
    print "if [[ -f \"$DOTFILES/zsh/.zshenv\" ]]; then"
    print "   source \"$DOTFILES/zsh/.zshenv\""
    print "fi"
}
if [[ ! -f ~/.zshenv || $(cat ~/.zshenv) != $(_mkzshenv) ]]; then
    print "Writing ~/.zshenv"
    _mkzshenv > ~/.zshenv
fi

mkdir -p $HOME/bin

# Remove broken symlinks in $HOME/bin
for cmd in $HOME/bin/*(N); do
    if [[ -L $cmd && ! -e $cmd ]]; then
        print "Removing broken symlink $cmd"
        rm "$cmd"
    fi
done

# Link files in $DOTFILES/bin to $HOME/bin
for cmd in $DOTFILES/bin/*(N)
do
    target=$HOME/bin/${cmd:t}
    [[ ${cmd:A} == ${target:A} ]] && continue
    print "Linking $target"
    ln -sf $cmd $HOME/bin/${cmd:t}
done

configs=(
    .config/vim
    .config/nvim
    .config/zed
    .config/procps
    .config/btop
    .tmux.conf
    .psqlrc
    .irbrc
)

for file in "${configs[@]}"
do
    source="${DOTFILES}/${file#.}"
    target="${HOME}/${file}"
    if [[ -d $target ]]; then
        files=($target/*(N))
        if (( $#files == 0 )); then
            print "Removing empty directory ~/$file"
            rmdir "$target"
        fi
    fi
    if [[ -e $target && ! -L $target ]]; then
        print "~/$file already exists and is not a symlink. Skipping."
    elif [[ $source -ef $target ]]; then
        # $target is already a link to $source. Skipping silently.
    else
        if [[ -L $target && ! $source -ef $target ]]; then
            print "~/$file is already linked to something else. Skipping."
            continue
        else
            print "Removing stale ~/$file symlink"
            rm "$target"
        fi
        print "Linking ~/$file"
        ln -sf "$source" "$target"
    fi
done
