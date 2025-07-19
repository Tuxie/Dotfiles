# Reclaim Ctrl-s and Ctrl-q in terminal emulators that emulate hardware a bit too accurately.
# Instead of freezing the terminal, we want to use Ctrl-s as the remote tmux prefix.

# This must run before powerlevel10k and other advanced prompts!

# Only when stdin is a tty
if [[ -t 0 ]]; then
    stty -ixon -ixoff
fi


# `reset` fixes most messed up terminals, but it also clears the screen.
# `fixterm` does everything it can that doesn't involve clearing the screen.
# In most cases it is enough, and it can be added as aliases to applications
# that are prone to mess up the terminal if they crash, like:
#   alias spotify_player='command spotify_player; fixterm'
fixterm() {
  # Disable mouse reporting modes that may have been enabled
  # 1000 = normal tracking, 1002 = button-motion, 1003 = all motion, 1006 = SGR mode
  printf '\e[?1000l\e[?1002l\e[?1003l\e[?1006l'

  # Restore the terminal screen if an alternate screen was used (e.g. by vim, less)
  tput rmcup

  # Reset the keyboard to normal mode (e.g. disable application cursor keys)
  tput rmkx

  # Disable meta key handling (disables 8th bit input mode)
  tput rmm

  # Make the cursor visible again if it was hidden
  tput cnorm

  # Restore sane tty settings (echo, line buffering, etc.)
  stty sane
}
