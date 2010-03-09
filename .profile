#
# IMPORTANT! Everything in this file much be compatible with both bash and zsh!
# Add shell-specific stuff to .bashrc or .zshrc instead.
#

export LC_ALL=en_GB.UTF-8

echo $PATH | grep -q /usr/local || export PATH=/usr/local/bin:/usr/local/sbin:$PATH
echo $PATH | grep -q /sw || export PATH=/sw/bin:/sw/sbin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$HOME/opt/bin:$HOME/opt/sbin:$PATH
export PATH=$HOME/opt/scala/bin:$PATH
export MANPATH=$HOME/opt/man:$HOME/opt/scala/man:/usr/local/man:/opt/local/man:$MANPATH
#export RUBYLIB=$HOME/opt/lib/ruby/site_ruby/1.8:$RUBYLIB
#export GEM_HOME=$HOME/opt
export EDITOR=vim

case "$(uname -s)" in
  Darwin)
    export CFLAGS="-O2 -march=nocona -pipe"
    ;;
  Linux)
    export CFLAGS="-O2 -march=x86_64 -pipe"
  *)
    echo "Please add a $(uname -s) profile!"
    ;;
esac

for DIR in /opt/local /usr/local $HOME/opt $HOME
do
  test -d $DIR/bin     && PATH="$DIR/bin:$PATH"
  test -d $DIR/sbin    && PATH="$DIR/sbin:$PATH"
  test -d $DIR/include && CPPFLAGS="-I$DIR/include $CPPFLAGS"
  test -d $DIR/lib     && LDFLAGS="-L$DIR/lib $LDFLAGS"
done

test -f /sw/bin/init.sh && . /sw/bin/init.sh

if "$(uname -s)" = "Darwin"; then
  alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
  alias ls="ls -G"
  alias ll="ls -lG"
  alias mplayer="/Applications/MPlayer\ OSX\ Extended.app/Contents/Resources/External_Binaries/mplayer.app/Contents/MacOS/mplayer"
  alias dosbox="/Applications/DOSBox.app/Contents/MacOS/DOSBox"
else
  alias ls="ls --color"
  alias ll="ls -l --color"
fi
alias vi=vim
alias gvim="vim -g"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

pget () {
  lftp -c "pget -c -n 4 $*"
}
