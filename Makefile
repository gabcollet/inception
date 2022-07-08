# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gcollet <gcollet@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/22 13:30:58 by gcollet           #+#    #+#              #
#    Updated: 2022/07/07 11:26:04 by gcollet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DIR			=	srcs

COUNTAINERS	=	$(eval MY_CONT=$(shell docker ps -qa))
IMAGES		=	$(eval MY_IMG=$(shell docker images -qa))
VOLUMES		=	$(eval MY_VOL=$(shell docker volume ls -q))
NETWORK		=	$(eval MY_NET=$(shell docker network ls -q))


all: up

up: 
	mkdir -p /home/gcollet/data/mysql
	mkdir -p /home/gcollet/data/html
	docker-compose -f $(DIR)/docker-compose.yml up --build

down:
	docker-compose -f $(DIR)/docker-compose.yml down

build:
	docker-compose -f $(DIR)/docker-compose.yml build

clean: 
	docker-compose -f $(DIR)/docker-compose.yml down --rmi all

vclean:
	docker volume rm $(shell docker volume ls -q)

#!WARNING: THIS WILL REMOVE EVERY CONTAINERS, IMAGES AND VOLUMES YOU HAVE
destroy:
	$(COUNTAINERS)
	$(IMAGES)
	$(VOLUMES)
	$(NETWORK)
	docker stop $(MY_CONT) || true 
	docker rm -f $(MY_CONT) || true 
	docker rmi -f $(MY_IMG) || true
	docker volume rm $(MY_VOL) || true
	docker network rm $(MY_NET) || true
	rm -rf /home/gcollet/data/mysql
	rm -rf /home/gcollet/data/html

.PHONY: all up down build clean destroy vclean
