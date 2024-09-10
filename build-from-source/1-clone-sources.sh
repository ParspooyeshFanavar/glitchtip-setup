#!/bin/bash
set -x

[ -d glitchtip-backend ] || git clone https://gitlab.com/glitchtip/glitchtip-backend.git
[ -d glitchtip-frontend ] || git clone https://gitlab.com/glitchtip/glitchtip-frontend.git