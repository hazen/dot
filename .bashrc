# append to the history file, don't overwrite it
#shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=1000
#HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export PATH=
export INCLUDE=${HOME}/include
export LIBDIR=${HOME}/lib
export PKG_CONFIG_PATH=
export EDITOR=vim

local="opt/readline opt/openssl opt/zlib opt/libffi"
for item in $local; do
    export PATH=${PATH}:/usr/local/$item/bin
    export INCLUDE=${INCLUDE}:/usr/local/$item/include
    export LIBDIR=${LIBDIR}:/usr/local/$item/lib
    export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/usr/local/$item/lib/pkgconfig
done
export PATH=${PATH}:/usr/local/bin
export INCLUDE=${INCLUDE}:/usr/local/include:/usr/include
export PATH=${PATH}:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/opt/local/bin
export LIBDIR=${LIBDIR}:/usr/local/lib:/usr/lib
# Used by gcc
#export CPATH=${INCLUDE}
#export CPLUS_INCLUDE_PATH=${INCLUDE}
#export LIBRARY_PATH=${LIBDIR}
#export LD_LIBRARY_PATH=${LIBDIR}

if [ -d "/usr/libexec/java_home" ]; then
    export JAVA_HOME=`/usr/libexec/java_home`
fi
export M2_HOME=/usr/local/opt/maven/libexec
export M2=/usr/local/opt/maven/libexec/bin

if [ -f "${HOME}/.bash_aliases" ]; then
  source ${HOME}/.bash_aliases
fi
if [ -f "${HOME}/.bash_secrets" ]; then
  source ${HOME}/.bash_secrets
fi

export ERL_LIBS=:/Users/hazen/dev/tools
export HOMEBREW_NO_ANALYTICS=1
export ERL_AFLAGS="-kernel shell_history enabled"
export ANDROID_HOME=/usr/local/share/android-sdk
export ANDROID_SDK_ROOT=/usr/local/share/android-sdk
export PATH=${PATH}:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

# asdf Version Manager
if [ -d "${HOME}/.asdf" ]; then
  . "${HOME}/.asdf/asdf.sh"
  . "${HOME}/.asdf/completions/asdf.bash"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hazen/google-cloud-sdk/path.bash.inc' ]; then source '/Users/hazen/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hazen/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/hazen/google-cloud-sdk/completion.bash.inc'; fi
if [ -f '/usr/local/bin/kubectl' ]; then
  source <(kubectl completion bash)
fi

# Bash command-line completion (needs gsed to be called sed)
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

