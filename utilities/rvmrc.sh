function rvmrc {
  create() {
    local dirname="$(basename `readlink -f .`)"
    if [ -z "$1" ] ; then
      echo "Select a ruby to use in this gemset"
      echo
      select ruby in `rvm list strings` ; do
        local ruby="$ruby" #set the local to mask the variable owned in the select
        break
      done
    else 
      local ruby="$1"
    fi

    if [ -z $LEGACY_MODE ] ; then
      echo $ruby > '.ruby-version'
      echo $dirname > '.ruby-gemset'
    else
      echo "RVM_STRING=\"rvm use $ruby@$dirname --create --verbose\"" > .rvmrc
      echo "[ -e './.rvmrc_local' ] && source './.rvmrc_local' || \$RVM_STRING" >> .rvmrc
    fi
  }

  #private

  __check_env() {
    [ ! rvm --version &>/dev/null ]      && echo "rvm not installed, quitting"   && return 1
    [ -z "$(rvm list strings | wc -l)" ] && echo "no rubies installed, quitting" && return 2
    return 0
  } >&2

  #dispatch

  if __check_env ; then
    $@
  else
    return $?
  fi

  unset create; unset __check_env;
}
