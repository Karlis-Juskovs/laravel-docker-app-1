#!/bin/bash

# Set proper permissions
chmod -R 775 /var/www/storage
chmod -R 775 /var/www/bootstrap/cache
chown -R www-data:www-data /var/www/storage
chown -R www-data:www-data /var/www/bootstrap/cache

# Create database if it doesn't exist and adjsut privileges
# mysql -h mysql-db -u root -p"${DB_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS base_2;"
# mysql -h mysql-db -u root -p"${DB_PASSWORD}" -e "GRANT ALL PRIVILEGES ON base_2.* TO 'base_user'@'%';"
# mysql -h mysql-db -u root -p"${DB_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS base_3;"
# mysql -h mysql-db -u root -p"${DB_PASSWORD}" -e "GRANT ALL PRIVILEGES ON base_3.* TO 'base_user'@'%';"
# mysql -h mysql-db -u root -p"${DB_PASSWORD}" -e "FLUSH PRIVILEGES;"

php artisan key:generate

# Run migrations
php artisan migrate

# Execute the CMD command
exec docker-php-entrypoint php-fpm
