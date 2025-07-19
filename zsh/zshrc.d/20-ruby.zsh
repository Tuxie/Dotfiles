# Make Homebrew's Ruby usable if it is installed
if [[ -e $HOMEBREW_PREFIX/opt/ruby/bin ]]; then
    # Homebrew's Ruby isn't linked to the default $PATH
    path=("$HOMEBREW_PREFIX/opt/ruby/bin" $path)

    # Get the user and the system rubygems bin directores
    gem_paths=($(ruby -r rubygems -e 'puts Gem.user_dir+"/bin "+Gem.bindir'))

    # Create the user bin dir if it doesn't exist yet, otherwise it will be
    # purged by a later $PATH cleanup
    mkdir -p "${gem_paths[1]}"

    # Add them to the path
    path=($gem_paths $path)
fi

# If rbenv is installed, use that instead
if (( $+commands[rbenv] )); then
    eval "$(rbenv init - zsh)"

	function rbenv-upgrade {
	    latest=$(rbenv install -l | grep -E '^\s*[0-9]+\.[0-9]+\.[0-9]+$' | tail -1)
		current=$(rbenv version | awk '{print $1}')
		if [[ "$latest" = "$current" ]]; then
		    echo "You already have the latest version $latest."
		else
            rbenv install $latest
		fi
		rbenv global $latest
		gem update
    }
fi

# Use pry instead of irb if it is installed
function irb {
		if (( $+commands[pry] )); then
				pry "$@"
		else
				command irb "$@"
		fi
}
