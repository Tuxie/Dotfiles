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
    brew
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
    # Use GNU ls, because it is has configurable colors
    recommended+=(gls:coreutils)
fi

if (( $+commands[pacman] )); then
    # Don't recommend brew on Arch Linux because it already has recent enough
    # versions of most things.
    recommended=(${recommended:#brew})
fi

missing=()
for tool in "${recommended[@]}"
do
    if (( ! $+commands[${tool%%:*}] )); then
        missing+=(${tool#*:})
    fi
done
if (( ${#missing[@]} )); then
    if (( ${missing[(I)brew]} )); then
        print "Please install Homebrew! https://brew.sh"
    fi
    print "Some packages are missing. Install them with:"
    print "  brew install ${(ou)missing[@]:#brew}"
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
