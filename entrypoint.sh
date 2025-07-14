#!/bin/bash
set -e

# Wait for the database to be ready
until pg_isready -h "$POSTGRES_HOST" -p "$POSTGRES_PORT" -U "postgres"; do
  echo "Waiting for postgres..."
  sleep 2
done

echo "Database is ready"

# Run database migrations
bundle exec rails db:migrate

# Remove a potentially pre-existing server PID (left over if we last reloaded)
rm -f /app/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile)
exec "$@"
