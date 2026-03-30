#!/usr/bin/env sh

set -eu

APP_DIR="/app"

cd "$APP_DIR"

mkdir -p \
  "$APP_DIR/data" \
  "$APP_DIR/logs" \
  "$APP_DIR/backups" \
  "$APP_DIR/static/uploads/images"

chmod 777 \
  "$APP_DIR/data" \
  "$APP_DIR/logs" \
  "$APP_DIR/backups" \
  "$APP_DIR/static/uploads" \
  "$APP_DIR/static/uploads/images" 2>/dev/null || true

if [ -z "${DB_PATH:-}" ]; then
  export DB_PATH="$APP_DIR/data/xianyu_data.db"
fi

if [ -z "${TZ:-}" ]; then
  export TZ="Asia/Shanghai"
fi

echo "Starting xianyu-super-butler..."
echo "Working directory: $APP_DIR"
echo "Database path: $DB_PATH"
echo "Timezone: $TZ"

exec python Start.py
