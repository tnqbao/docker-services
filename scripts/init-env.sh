#!/bin/bash

echo "Initializing .env files from .env.example..."

find . -type f -name ".env.example" | while read example; do
    target="${example/.env.example/.env}"
    if [ ! -f "$target" ]; then
        cp "$example" "$target"
        echo "Created $target"
    else
        echo "Skipped $target (already exists)"
    fi
done
