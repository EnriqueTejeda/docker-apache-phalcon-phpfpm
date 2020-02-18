.PHONY: build
build:
	@docker build --build-arg PHALCON_VERSION=3.4.5 --build-arg PSR_VERSION=0.7.0 . -t etejeda/docker-apache-phalcon-phpfpm:latest