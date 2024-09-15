#!/bin/bash

source functions.sh

docker-exec-on-name glitchtip-postgres psql -U postgres postgres