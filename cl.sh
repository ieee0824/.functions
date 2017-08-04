#!/bin/bash

function cl() {
	PROFILE=${PROFILE:=default}
	if ! type "aws" > /dev/null; then
		return 1;
	elif ! type "jq" > /dev/null; then
		return 1;
	elif ! type "peco" > /dev/null; then
		return 1;
	elif ! type "awslogs" > /dev/null; then
		return 1;
	fi

	LOG_GROUP=$(aws logs describe-log-groups --max-items 2000 --profile $PROFILE | jq '.logGroups[].logGroupName' | peco)
	awslogs get --aws-region ap-northeast-1 $LOG_GROUP ALL --watch --profile $PROFILE
}

