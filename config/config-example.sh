# ===================================
# bash-deploy
#  Overwrite Environment file
#
# LICENSE: MIT License
# author: yusuke@newsdict.xyz
# github: newsdict/bash-deploy
# ===================================

#
# application name
#
application=application-name

#
# debug (1|0)
#
xtrace=0

#
# display messages
#
display_messages=1

#
# log name
#
log_name=logs/backup.$now.log

#
# scm (local|git)
#  overwrite scm
#
scm=local

#
# link_dirs like capistrano
#
declare -a linked_dirs=('logs' 'tmp')

#
# keep relasese files
#
keep_releases=5