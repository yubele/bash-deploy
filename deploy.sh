#!/usr/bin/env bash
# ===================================
# bash-deploy
#  Deploy script used bash
#
# version: 0.1.0
# LICENSE: MIT License
# author: yusuke@newsdict.xyz
# github: newsdict/bash-deploy
# ===================================

# The Set Buildin
# https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
set -o errexit
set -o pipefail

# Current Paht of script
current_path=$(pwd)/$(dirname $BASH_SOURCE)

# Include functions
source $current_path/functions.sh

# parse arguments
declare -A options
pasrse_arguments $@

# require config/*/**
require_environments ${options[0]}

#echo ${options[args]}
#version
exit

# clean up temporary files
clean
