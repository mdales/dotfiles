# This is called if the shell is interactive
# Assume that most of the environment has been built by .zprofile at
# login

#echo .zshrc

bindkey -e

export PS1="$(print '%{\e[0;32m%}%m%{\e[0m%}')$(print '%{\e[0;33m%}[%1d]%{\e[0m%}')%# "
export RPS1="$(print '%{\e[0;36m%}%T%{\e[0m%}')"

setopt extendedglob
setopt pushdsilent
setopt nobgnice

# load my aliases
source ~/library/dot-files/aliases

hosts = ()

autoload -U compinit
compinit -C
zstyle ":completion:*" hosts $hosts

rgrep()
{
  find . $follow \! -type d -a \! -name "*.o" -a \! -name "*.gz" -a \! -name "*.tar" -a \! -name "*,v" -a \! -name "*.a" -print | xargs grep "$@"
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# OPAM configuration
. /Users/michael/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
