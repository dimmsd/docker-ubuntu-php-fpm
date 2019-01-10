[![Build Status](https://travis-ci.org/dimmsd/docker-ubuntu-php-fpm.svg?branch=master)](https://travis-ci.org/dimmsd/docker-ubuntu-php-fpm)

## Ubuntu PHP-FPM image

[The Docker Hub page](https://hub.docker.com/r/dimmsd/ubuntu-php-fpm)

Image size ~ 200 MB

Ubuntu 16.04 + PHP-FPM (версии PHP 5.6, 7.0, 7.1, 7.2, 7.3)

Contains php-fpm, php-cli, xdebug, composer

Default XDEBUG enabled for PHP-FPM and disabled for PHP-CLI

Image tags 16.04.5.6 - 16.04.7.3

Example based on images:

[Ubuntu base image](https://github.com/dimmsd/docker-ubuntu-base)

### Using the `Makefile`

```
$ make help
config-test			Test docker-compose.yml
set-www-access			Set permissions for ./www folder : 644 for files and 755 for folders
build				Build a Dockerfile
up				Up service
down				Down service
exec-as-root			Attach to PHP-FPM container and start bash session
exec-as-user			Attach to PHP-FPM container and start bash session under user $(OWN_USER)
fpm-status			Show PHP-FPM status page
fpm-exec-index			Execute /var/www/main/index.php over PHP-FPM
```

### Example

```
$ git clone git://github.com/dimmsd/docker-ubuntu-php-fpm.git
$ cd docker-ubuntu-php-fpm
$ cp .env.example .env
$ make build
$ make up
```

### Environment

See `.env.example` for detail

### Run Docker commands without sudo

See this [section](https://github.com/dimmsd/docker-ubuntu-base#run-docker-commands-without-sudo).