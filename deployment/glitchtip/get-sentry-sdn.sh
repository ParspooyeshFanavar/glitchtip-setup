#!/bin/bash
# Usage: ./get-sentry-sdn.sh [PROJECT_ID]
#set -x

PROJECT_ID=$1
if [ -z $PROJECT_ID ] ; then
    PROJECT_ID=1
fi

source functions.sh

IP=$(docker-gateway-ip glitchtip-web-1)
PORT=8111

QUERY="SELECT REPLACE(public_key::text,'-','') from projects_projectkey WHERE project_id=$PROJECT_ID;"

POSTGRES_ID=$(docker-running-by-name glitchtip-postgres)
if [ -z $POSTGRES_ID ] ; then
    echo "No running container by image name glitchtip-postgres"
    exit 1
fi

PUBLIC_KEY=$(docker exec -i $POSTGRES_ID \
    psql -U postgres postgres -c "$QUERY" \
    | head -n3 | tail -n1 | sed 's/ //g')

SENTRY_DSN=http://$PUBLIC_KEY@$IP:$PORT/$PROJECT_ID

echo "SENTRY_DSN=$SENTRY_DSN"

