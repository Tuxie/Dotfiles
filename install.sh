#!/usr/bin/env bash

export dotfiles="$(cd "$(dirname "$0")" && pwd)"

function die {
	echo "$@"
	exit 1
}

for tool in git rsync vimpager fzf curl
do
  which $tool &>/dev/null || die "Please install $tool!"
done

function clone_or_pull {
	URL="$1"
	DIR="$2"
	mkdir -p "$DIR"
	echo "Updating $DIR:"
	if test -d "$DIR/.git"; then
		(cd "$DIR" && git pull)
	else
		git clone "$URL" "$DIR"
	fi
}

clone_or_pull https://github.com/ohmyzsh/ohmyzsh "$dotfiles/zsh/oh-my-zsh"
clone_or_pull https://github.com/zsh-users/zsh-syntax-highlighting "$dotfiles/zsh/plugins/zsh-syntax-highlighting"
clone_or_pull https://github.com/zsh-users/zsh-autosuggestions "$dotfiles/zsh/plugins/zsh-autosuggestions"

rsync -ra $dotfiles/bin/ $HOME/bin/
#for CMD in $dotfiles/bin/*
#do
#  ln -sf $CMD $HOME/bin/$(basename $CMD)
#done

cat <<-end > $HOME/.zshrc
# This file will be overwritten!
# Make changes to .zshrc.local instead.

source "$dotfiles/zsh/zshrc"
end

# Vim
test -L $HOME/.vim && rm $HOME/.vim
mkdir -p $HOME/.vim $HOME/.config/nvim $HOME/.local/share/nvim
ln -sf $dotfiles/vimrc $HOME/.vim/vimrc
ln -sf $HOME/.vim/vimrc $HOME/.config/nvim/init.vim
ln -sf $HOME/.vim/ $HOME/.local/share/nvim/site

# TMUX
ln -sf $dotfiles/tmux.conf $HOME/.tmux.conf

# PSQL
ln -sf $dotfiles/psqlrc $HOME/.psqlrc

# Ruby
ln -sf $dotfiles/irbrc $HOME/.irbrc

echo "Done."
