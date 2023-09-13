# Use an official PHP image as the base image
FROM php:8.1-fpm

# Set the working directory inside the container
WORKDIR /var/www/html

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy the application code into the container
COPY . .

# Install application dependencies using Composer
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Generate an application key
RUN php artisan key:generate

# Expose port 9000 to communicate with Nginx or another web server
EXPOSE 9000

# Start the PHP-FPM server
CMD ["php-fpm"]

# Optionally, you can add additional configuration and optimization steps here
