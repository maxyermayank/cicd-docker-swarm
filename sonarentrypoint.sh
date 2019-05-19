#!/usr/bin/env bash

pass=$(cat /run/secrets/postgres-passwd)
export sonar.jdbc.password="$pass"

exec "$@"