#

FROM php:7.2-zts
LABEL maintainer "mt08xx@users.noreply.github.com"

# Install dependencies
RUN apt-get update && \
    apt-get -y install wget git-core libyaml-dev libzip-dev zip && \
    rm -rf /var/lib/apt/lists/*

# Make the directory we will need
RUN	mkdir -p /data
WORKDIR /data

# Grab the pre-built PHP 7.2 distribution from PMMP
RUN docker-php-ext-install bcmath && \
docker-php-ext-configure zip --with-libzip && docker-php-ext-install zip && \
docker-php-ext-install sockets && \
pecl install yaml && docker-php-ext-enable yaml && \
git clone --depth=1 -b v3.2.0 https://github.com/krakjoe/pthreads /tmp/pthreads && \
docker-php-ext-configure /tmp/pthreads --enable-pthreads && \
docker-php-ext-install /tmp/pthreads && \
rm -rf /tmp/pthreads

ADD entry.sh /entry.sh
# Expose the right port
EXPOSE 19132/udp

# Set up the volume for the data
VOLUME /data

# Run the app when launched
CMD [ "bash", "/entry.sh"]
