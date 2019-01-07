#!/usr/bin/make

SHELL = /bin/sh

.DEFAULT_GOAL := help
.PHONY : help config-test build up down exec-as-root exec-as-user fpm-status fpm-exec-index

cnf ?= .env

ifneq ("$(wildcard $(cnf))","")
include $(cnf)
else
$(error "ERROR! File .env not found. Rename .env.example => .env")
endif

FPMIP=$(shell docker inspect con-$(FPM_IMAGE) | grep '"IPAddress"' | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b")

help:
	@echo "Help:"
	@echo "\tconfig-test - Test docker-compose.yml"
	@echo "\tset-log-access - Set permissions for PHP-FPM log (for read from host)"
	@echo "\tset-www-access - Set permissions for ./www folder: 644 for files and 755 for folders"
	@echo "\tbuild - Build a Dockefile"
	@echo "\tup - Up service"
	@echo "\tdown - Down service"
	@echo "\texec-as-root - Attach to PHP-FPM container and start bash session"
	@echo "\texec-as-user - Attach to PHP-FPM container and start bash session under user $(OWN_USER)"
	@echo "\tfpm-status - Show PHP-FPM status page"
	@echo "\tfpm-exec-index - Execute /var/www/main/index.php over PHP-FPM"
config-test:
	@docker-compose -f docker-compose.yml config
set-log-access:
	sudo chmod -R 644 ./log-fpm/*
set-www-access:
	find ./www/ -type f -exec chmod 644 {} \;
	find ./www/ -type d -exec chmod 755 {} \;
build:
	@docker-compose build
up:
	@docker-compose up -d --build
down:
	@docker-compose down
exec-as-root:
	@docker exec -it con-$(FPM_IMAGE) bash
exec-as-user:
	@docker exec -u $(OWN_USER) -it con-$(FPM_IMAGE) bash
fpm-status:
	@docker exec -it con-$(FPM_IMAGE) /usr/local/bin/test-php-fpm.sh  127.0.0.1 status status
fpm-exec-index:
	@docker exec -it con-$(FPM_IMAGE) /usr/local/bin/test-php-fpm.sh 127.0.0.1 index.php /var/www/main/index.php
