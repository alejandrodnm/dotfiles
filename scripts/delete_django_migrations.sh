#!/bin/sh
echo "Starting ..."

echo ">> Deleting old migrations"
find . -path "*/migrations/*.py" -not -name "__init__.py" -delete

echo ">> Deleting database"
psql -U postgres -c "DROP DATABASE $1"
psql -U postgres -c "CREATE DATABASE $1"

echo ">> Running manage.py makemigrations"
python manage.py makemigrations

echo ">> Running manage.py migrate"
python manage.py migrate

echo ">> Done"
