#!/bin/bash -e

#######################################
# Name: Traverse grep
# Date: 2017-07-20
# Author: ieee0824
#
# Details:
#	File search function on bash.
#
# LICENSE:
#	MIT
#######################################

function tgrep() {
	if [ $# = 0 ]; then
		echo "no args"
		return 1
	fi

	if [ 3 -le $# ]; then
		echo "too many args"
		return 1
	fi

	if [ 1 = $# ]; then
		find $(pwd) -type f -print | xargs grep --color=auto $1
	else
		find $1 -type f -print | xargs grep --color=auto $2
	fi
	return 0
}
