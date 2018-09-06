#!/usr/bin/env bash

PGPASSWORD=$DB_ADMIN_PASSWORD \
  psql -U$DB_ADMIN_USER -h$DB_HOST -p$DB_PORT -w postgres <<EOS
CREATE USER $DB_USER WITH CREATEDB PASSWORD '$DB_PASSWORD';
CREATE DATABASE $DB_NAME;
GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;
ALTER DATABASE $DB_NAME OWNER TO $DB_USER;
EOS

bundle exec rake db:load_sample_if_empty_db
