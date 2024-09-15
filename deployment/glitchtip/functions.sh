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
	docker exec -i $ID "$@"
}

function docker-gateway-ip() {
	ID=$(docker-running-by-name $1)
	if [ -z $ID ] ; then
		echo "No running container by image name $1"
		return
	fi
	docker inspect -f '{{range.NetworkSettings.Networks}}{{.Gateway}}{{end}}' $ID
}