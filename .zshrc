# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:${HOMEBREW_ROOT}/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/hazen/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="${HOMEBREW_ROOT}/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch arm64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt share_history
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/hazen/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH=
#export INCLUDE=${HOME}/include
#export LIBDIR=${HOME}/lib
export PKG_CONFIG_PATH=
export EDITOR=vim
export ERL_AFLAGS="-kernel shell_history enabled"
export HOMEBREW_ROOT="/usr/local"
if [ "$(/usr/bin/uname -p)" = "arm" ]; then
  export HOMEBREW_ROOT="/opt/homebrew"
  export CFLAGS="-O2 -g -arch arm64"
  export CXXFLAGS="-arch arm64"
  export LDFLAGS="-arch arm64"
fi

#local="opt/readline opt/openssl opt/libsodium"
#for item in $(echo $local); do
#    export PATH=${PATH}:${HOMEBREW_ROOT}/$item/bin
#    export INCLUDE=${INCLUDE}:${HOMEBREW_ROOT}/$item/include
#    export LIBDIR=${LIBDIR}:${HOMEBREW_ROOT}/$item/lib
#    export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:${HOMEBREW_ROOT}/$item/lib/pkgconfig
#done
export PATH=${PATH}:${HOMEBREW_ROOT}/bin
export INCLUDE=${INCLUDE}:${HOMEBREW_ROOT}/include:/usr/include
export CPATH=${INCLUDE}:${HOMEBREW_ROOT}/include:/usr/include
export PATH=${PATH}:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/bin
export LIBDIR=${LIBDIR}:${HOMEBREW_ROOT}/lib:/usr/lib
export LIBRARY_PATH=${LIBDIR}:${HOMEBREW_ROOT}/lib:/usr/lib

if [ -f "$HOME/.zsh_aliases" ]; then
  source "$HOME/.zsh_aliases"
fi
if [ -f "${HOME}/.zsh_secrets" ]; then
  source ${HOME}/.zsh_secrets
fi

if [ -f "${HOMEBREW_ROOT}/opt/zsh-git-prompt/zshrc.sh" ]; then
  source "${HOMEBREW_ROOT}/opt/zsh-git-prompt/zshrc.sh"
fi

if [ -f "$HOME/.zsh_prompt" ]; then
  source "$HOME/.zsh_prompt"
fi

# asdf Version Manager
source /opt/homebrew/opt/asdf/libexec/asdf.sh
export PATH="/opt/homebrew/opt/postgresql@16/bin":$PATH

if [ -f '${HOMEBREW_ROOT}/bin/kubectl' ]; then
  source <(kubectl completion zsh)
fi

if type brew &>/dev/null; then
  FPATH=${HOMEBREW_ROOT}/share/zsh/site-functions:$FPATH
fi
export KERL_CONFIGURE_OPTIONS="--disable-hipe --with-wx-config=$(brew --prefix wxwidgets)/bin/wx-config --with-odbc=$(brew --prefix unixodbc)"
