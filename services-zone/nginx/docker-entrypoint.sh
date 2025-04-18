#!/bin/sh

# Create symlinks from sites-available to sites-enabled
for file in /etc/nginx/sites-available/*.conf; do
  ln -sf "$file" /etc/nginx/sites-enabled/$(basename "$file")
done

# Run nginx in foreground
nginx -g "daemon off;"
