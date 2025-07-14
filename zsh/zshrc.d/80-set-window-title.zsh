# Set window title

function set_window_title {
	print -Pn "\e]0;%n@%m:%~\a"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd set_window_title
