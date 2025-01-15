#!/bin/bash
set -e

# Ensure the database directory exists and has correct permissions
chown -R www-data:www-data /var/www/html/db
chmod 777 /var/www/html/db

# Initialize the database if it doesn't exist
if [ ! -f /var/www/html/db/samurai_dojo_basic.sqlite ]; then
    echo "Initializing database..."
    cd /var/www/html
    php reset-db.php
    chown www-data:www-data /var/www/html/db/samurai_dojo_basic.sqlite
    chmod 666 /var/www/html/db/samurai_dojo_basic.sqlite
fi

# Start Apache in foreground
apache2-foreground
