#!/bin/bash

rm -rf glitchtip-backend/dist/ 2>/dev/null || true
mkdir -p glitchtip-backend/dist/
cp -r glitchtip-frontend/dist/glitchtip-frontend/* glitchtip-backend/dist/

docker build \
    --tag hub-private.parspooyesh.net/glitchtip-parspooyesh:latest \
    --build-arg COLLECT_STATIC="True" \
    glitchtip-backend # ./docker-buildx