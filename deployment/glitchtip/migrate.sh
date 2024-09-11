#!/bin/bash

source functions.sh

docker-shell-to-name glitchtip-web-1 python manage.py migrate
