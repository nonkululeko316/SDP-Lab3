#!/usr/bin/env bash
set -e

if [ -z "$DATABASE_URL" ]; then
  echo "DATABASE_URL is not set (e.g. postgres://USER:PASSWORD@HOST:5432/DBNAME)" >&2
  exit 1
fi

npm ci
npm run build
npm prune --omit=dev
node build
