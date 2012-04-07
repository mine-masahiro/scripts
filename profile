#!/bin/bash

if [ `uname` = 'Darwin' ] ; then
  export OSX="0"
  unset LINUX
elif [ `uname` = 'Linux' ] ; then
  export LINUX="0"
  unset OSX
fi

export PATH="/usr/local/Cellar/bash/*/bin/:$PATH"
export PATH="$HOME/.bash/:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Users/jfredett/.cabal/bin/:$PATH"
export PATH="/usr/local/lib/node_modules/:$PATH"

export VIM_PATH="$HOME/.vim"

export LS_COLORS='di=01;36'
export EDITOR='vim'

export HISTSIZE=99999
export HISTFILESIZE=99999

source "$HOME/.bash/rc"

### Added by surfraw. To remove use surfraw-update-path -remove
	export PATH=$PATH:/usr/local/Cellar/surfraw/2.2.8/lib/surfraw
### End surfraw addition.

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
