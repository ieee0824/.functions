#!/bin/bash -e

branch() {
	BRANCH=$(git branch | grep "\* " | sed -e "s/\* //g")

	if [ ${BRANCH} = "master" ]; then
		echo "master_locked"
	else
		echo $BRANCH
	fi
}
