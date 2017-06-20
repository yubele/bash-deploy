# ===================================
# bash-deploy
#  Environment file
#
# LICENSE: MIT License
# author: yusuke@newsdict.xyz
# github: newsdict/bash-deploy
# ===================================

#
# Remote Directory
#
deploy_to='~/deploy_to'

#
# Git Repository
#
repo_url='git@github.com:newsdict/bash-deploy.git'

#
# scm (Support git, yet)
#
scm=git

#
# git branch name
#
branch=master

#
# deploying servers
#
declare -A servers=(
  [hostname_or_ipaddresses]="app deploy"
  [hostname_or_ipaddresses]="app deploy"
  [hostname_or_ipaddresses]="db"
)