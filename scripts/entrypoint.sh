#!/bin/sh

if [ "$DATABASE" = "db2" ]
then
    echo "Waiting for DB2..."

    while ! nc -z $DB2_HOST $DB2_PORT; do
      sleep 0.1
    done

    echo "DB2 started"
fi

python manage.py migrate
python manage.py collectstatic --noinput

exec "$@"
