#!/usr/bin/env zsh

# The full path to the directory containing this file, symlinks expanded
export DOTFILES="${${(%):-%N}:A:h}"

cd "$DOTFILES"
git submodule update --init --remote --merge --recursive
cd ~

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
        print "  pacman -Sy ${(ou)missing[@]}"
    elif (( $+commands[apt-get] )); then
        print "  apt install ${(ou)missing[@]}"
    elif (( $+commands[brew] )); then
        print "  brew install ${(ou)missing[@]}"
    else
        print "  ${(ou)missing[@]}"
    fi
    exit 1
fi

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
    if [[ -d $HOME/$file ]]; then
        files=($HOME/$file/*(N))
        if (( $#files == 0 )); then
            print "Removing empty directory $HOME/$file"
            rmdir "$HOME/$file"
        fi
    fi
    if [[ ! -e $HOME/$file ]]; then
        print "Linking $HOME/$file"
        ln -sf "$DOTFILES/${file#.}" "$HOME/$file"
    fi
done
