# The following lines were added by compinstall
zstyle :compinstall filename '/Users/hazen/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH=
export INCLUDE=${HOME}/include
export LIBDIR=${HOME}/lib
export PKG_CONFIG_PATH=
export EDITOR=vim

local="opt/readline opt/openssl opt/zlib opt/libffi"
for item in $(echo $local); do
    export PATH=${PATH}:/usr/local/$item/bin
    export INCLUDE=${INCLUDE}:/usr/local/$item/include
    export LIBDIR=${LIBDIR}:/usr/local/$item/lib
    export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/usr/local/$item/lib/pkgconfig
done
export PATH=${PATH}:/usr/local/bin
export INCLUDE=${INCLUDE}:/usr/local/include:/usr/include
export PATH=${PATH}:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/opt/local/bin
export LIBDIR=${LIBDIR}:/usr/local/lib:/usr/lib

export ANDROID_HOME=/usr/local/share/android-sdk
export ANDROID_SDK_ROOT=/usr/local/share/android-sdk
export PATH=${PATH}:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

if [ -f "$HOME/.zsh_aliases" ]; then
  source "$HOME/.zsh_aliases"
fi
if [ -f "${HOME}/.zsh_secrets" ]; then
  source ${HOME}/.zsh_secrets
fi

if [ -f "/usr/local/opt/zsh-git-prompt/zshrc.sh" ]; then
  source "/usr/local/opt/zsh-git-prompt/zshrc.sh"
fi

if [ -f "$HOME/.zsh_prompt" ]; then
  source "$HOME/.zsh_prompt"
fi

# asdf Version Manager
if [ -d "${HOME}/.asdf" ]; then
  . "${HOME}/.asdf/asdf.sh"
  . "${HOME}/.asdf/completions/asdf.bash"
fi

if [ -f '/usr/local/bin/kubectl' ]; then
  source <(kubectl completion zsh)
fi

