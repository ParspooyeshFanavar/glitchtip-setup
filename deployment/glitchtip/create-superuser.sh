source functions.sh

set -a
source .env

docker-exec-on-name glitchtip-web-1 python manage.py createsuperuser --email "$DJANGO_SUPERUSER_EMAIL" --noinput

