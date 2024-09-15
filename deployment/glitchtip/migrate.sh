#!/bin/bash

source functions.sh

docker-exec-on-name glitchtip-web-1 python manage.py migrate
