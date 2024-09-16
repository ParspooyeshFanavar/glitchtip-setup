#!/bin/bash

if [ -f .env ] ; then
	echo ".env file already exists"
	exit 0
fi

function newlongpassword() {
	uuidgen | sed 's/-//g'
}

echo "DATABASE_URL=postgres://postgres:postgres@postgres:5432/postgres
SECRET_KEY=$(newlongpassword)
PORT=8000
EMAIL_URL=consolemail://
GLITCHTIP_DOMAIN=http://0.0.0.0:8000
CELERY_WORKER_AUTOSCALE=1,3
CELERY_WORKER_MAX_TASKS_PER_CHILD=10000
DEFAULT_FROM_EMAIL=glitchtip-admin@parspooyesh.com
DJANGO_SUPERUSER_EMAIL=glitchtip-admin@parspooyesh.com
DJANGO_SUPERUSER_PASSWORD=$(newlongpassword)
DEBUG=True" > .env

echo "Created .env file (make sure to backup this file)"