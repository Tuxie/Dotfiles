# Let us install software with ./configure --prefix=$HOME/.local and similar

mkdir -p "$HOME/.local/bin"
path=("$HOME/.local/bin" $path)
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
export PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"
