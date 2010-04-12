# IMPORTANT! Everything in this file much be compatible with both bash and zsh!
# Add shell-specific stuff to .bashrc or .zshrc instead.

export LC_ALL=en_GB.UTF-8

#export RUBYLIB=$HOME/opt/lib/ruby/site_ruby/1.8:$RUBYLIB
#export GEM_HOME=$HOME/opt
export EDITOR=vim
export VISUAL=vim

case "$(uname -s)" in
  Darwin) . $HOME/.profile.mac ;;
  Linux)  . $HOME/.profile.linux ;;
  *)      echo "Please add a $(uname -s) profile!" ;;
esac

for DIR in /{opt/local,sw,usr/local,$HOME/opt,$HOME}/{bin,sbin,include,lib,man,info,share/info}
do
  test -d $DIR || continue
  case "$DIR" in
    */bin|*/sbin) echo $PATH     | grep -q "$DIR"  || PATH="$DIR:$PATH" ;;
    */include)    echo $CPPFLAGS | grep -q "I$DIR" || CPPFLAGS="-I$DIR $CPPFLAGS" ;;
    */lib)        echo $LDFLAGS  | grep -q "L$DIR" || LDFLAGS="-L$DIR $LDFLAGS" ;;
    */man)        echo $MANPATH  | grep -q "$DIR"  || MANPATH="$DIR:$MANPATH" ;;
    */info)       echo $INFOPATH | grep -q "$DIR"  || INFOPATH="$DIR:$INFOPATH" ;;
  esac
done

alias vi=vim
alias gvim="vim -g"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

case "$(hostname)" in
  *.snowmen.se) . $HOME/.profile.work ;;
esac

export RUBY_MAJOR_VERSION=$(ruby --version 2>&1 | esed 's:^ruby ([0-9]+\.[0-9]+).*:\1:g')
export GEM_HOME=$HOME/.gem/ruby/$RUBY_MAJOR_VERSION
export PATH=$GEM_HOME/bin:$PATH

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

which rvm &>/dev/null && rvm use 1.9.1
