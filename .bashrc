# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export PATH=/usr/local/bin
#export MANPATH=/usr/share/man:/usr/X11/man:/usr/X11/share/man:/usr/local/man:/opt/local/man
export INCLUDE=${HOME}/include
export LIBDIR=${HOME}/lib
#export DYLD_LIBRARY_PATH=/usr/local/lib:/opt/local/lib:/usr/lib:/usr/X11/lib
#export DYLD_LIBRARY_PATH=
export PKG_CONFIG_PATH=
export EDITOR=vim

local="erln8 popt-1.16 cygutils-1.4.10 libevent-2.0.21 libuv-v0.11.22 opt/readline opt/openssl python-3.3.6"
#local="erlang-R15B03 popt-1.16 cygutils-1.4.10 protobuf-2.5.0 protobuf-c-0.15 libevent-2.0.21"
#local="erlang-R16B02-basho3 popt-1.16 cygutils-1.4.10 protobuf-2.4.1 protobuf-c-0.15 libevent-2.0.21 zlog-1.2.12"
for item in $local; do
    export PATH=${PATH}:/usr/local/$item/bin
    #export MANPATH=${MANPATH}:/usr/local/$item/share/man
    export INCLUDE=${INCLUDE}:/usr/local/$item/include
    export LIBDIR=${LIBDIR}:/usr/local/$item/lib
    export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/usr/local/$item/lib/pkgconfig
#    export DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:/usr/local/$item/lib
done
export INCLUDE=${INCLUDE}:/usr/local/include:/usr/include
export PATH=${PATH}:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/opt/local/bin
export LIBDIR=${LIBDIR}:/usr/local/lib:/usr/lib
# Used by gcc
export CPATH=${INCLUDE}
export CPLUS_INCLUDE_PATH=${INCLUDE}
export LIBRARY_PATH=${LIBDIR}
export LD_LIBRARY_PATH=${LIBDIR}

if [ -d "/usr/libexec/java_home" ]; then
    export JAVA_HOME=`/usr/libexec/java_home`
fi
#export M2_HOME=/usr/local/apache-maven-3.0.5
export M2_HOME=/usr/local/opt/maven/libexec
export M2=/usr/local/opt/maven/libexec/bin

if [ -f "${HOME}/.bash_aliases" ]; then
  source ${HOME}/.bash_aliases
fi
if [ -f "${HOME}/.bash_secrets" ]; then
  source ${HOME}/.bash_secrets
fi

#export RIAK_TEST_PB_PORT='10017'
#export RIAK_TEST_HTTP_PORT='10018'
export RT_DEST_DIR=${HOME}/dev/rt/riak
export R14B04=/usr/local/erlang/R14B04.64bit
export R15B01=/usr/local/erlang-R15B01
export R15B02=/usr/local/erlang-R15B02
export R15B03=/usr/local/erlang-R15B03
export R16B01=/usr/local/erlang-R16B01
export R16B02=/usr/local/erlang-R16B02-basho8
export CURRENT_OTP=/usr/local/erlang-R16B02-basho8
export ERL_LIBS=:/Users/hazen/dev/tools

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Ruby
# place in ~/.bash_profile as the very last line
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
