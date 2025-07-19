# Increase the allowed amount of open file descriptors
ulimit -n 10240

# Enable extended wildcards
setopt BAD_PATTERN     # Print error messages for incorrect patterns
setopt CASE_GLOB       # Make glob patterns case sensitive
setopt CASE_MATCH      # Make regular expresions case sensitive
setopt GLOB_STAR_SHORT # Make **.c equivalent to **/*.c

# Don't share history between hosts
HISTSIZE=1000000
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.zsh_history
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
