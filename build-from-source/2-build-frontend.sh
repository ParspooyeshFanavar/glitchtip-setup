#!/bin/bash
set -x

cd glitchtip-frontend/
proxychains npm ci  # what is --force ???
npm run build-prod
