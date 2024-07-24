FROM php:8.1-fpm

WORKDIR /var/www

# Installez les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install pdo pdo_mysql

# Installez Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copiez le code source
COPY . .

# Installez les dépendances de Laravel
RUN composer install

# Commande pour démarrer le serveur intégré de Laravel
CMD php artisan serve --host=0.0.0.0 --port=8000
