#!/bin/sh

if [ ! -f /app/pb_data/seed_admin_done ]; then
  echo "Creating initial superadmin..."

  /app/pocketbase superuser create "$POCKETBASE_ADMIN_USERNAME" "$POCKETBASE_ADMIN_PASSWORD"

  touch /app/pb_data/seed_admin_done
else
  echo "Superadmin already created."
fi
