# Reclaim Ctrl-s and Ctrl-q in terminal emulators that emulate hardware a bit too accurately.
# Instead of freezing the terminal, we want to use Ctrl-s as the remote tmux prefix.

# This must run before powerlevel10k and other advanced prompts!

# Only when stdin is a tty
if [[ -t 0 ]]; then
    stty -ixon -ixoff
fi
