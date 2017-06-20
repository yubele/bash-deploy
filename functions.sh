# ===================================
# bash-deploy
#  Functions file
#
# LICENSE: MIT License
# author: yusuke@newsdict.xyz
# github: newsdict/bash-deploy
# ===================================

# current date time
now=$(date +%Y%m%d%H%M)
date=$(date +%Y%m%d)

# Requre common file
if [ -f $current_path/config/config.sh ]; then
  source $current_path/config/config.sh
else
  # cannot use log::error
  echo '[ERROR] not found config/config.sh file'
  exit
fi
# Require environment file
require_environments()
{
  if [ -z "${options[0]}" ] || [ ! -f $current_path/config/deploy/${options[0]}.sh ] ; then
    log::error "do not set environment"
  else
    source $current_path/config/deploy/${options[0]}.sh
    log::info "Environment: ${options[0]}"
  fi

}
# parse arguments
#  usage)
#   declare -A options
#   pasrse_arguments $@
function pasrse_arguments()
{
  local kv_regex='^--?(.+)=(.+)$'
  local k_regex='^--?([^=]+)$'
  local argc=0
  for arg in $@
  do
    if [[ $arg =~ $kv_regex ]]; then
      options[${BASH_REMATCH[1]}]=${BASH_REMATCH[2]}
    elif [[ $arg =~ $k_regex ]]; then
      options[${BASH_REMATCH[1]}]=1
    else
      options[$argc]=$arg
      argc=$(( $argc + 1 ))
    fi
  done
}
# echo version
function version()
{
  echo $(cat $current_path/VERSION)
}
function clean()
{
  rm -rf $working_directory
  rm $compress_name
}
function log::info()
{
  echo "["$(date +"%Y-%m-%d %H:%M:%S")"] "$1 2>&1 >> $current_path/$log_name
  if [ $display_messages -eq 1 ]; then
    echo -e "\e[1;32m["$(date +"%Y-%m-%d %H:%M:%S")"] "$1"\e[0m"
  fi
}
function log::error()
{
  echo "["$(date +"%Y-%m-%d %H:%M:%S")"] [ERROR] "$1 2>&1 >> $current_path/$log_name
  if [ $display_messages -eq 1 ]; then
    echo -e "\e[1;31m["$(date +"%Y-%m-%d %H:%M:%S")"] [ERROR] "$1"\e[0m"
  fi
  exit 1
}