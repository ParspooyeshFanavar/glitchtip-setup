#!/bin/bash

function docker-running-by-name() {
	# docker ps --filter name=$1 --quiet  # does not always work!
	docker ps | grep "$@" | sed 's/ .*//' | head -n1
}

function docker-shell-to-name() {
	ID=$(docker-running-by-name $1)
	if [ -z $ID ] ; then
		echo "No running container by image name $1"
		return
	fi
	shift
	if [ -z $1 ] ; then
		docker exec -it $ID /bin/bash
		return
	fi
	docker exec -it $ID "$@"
}
