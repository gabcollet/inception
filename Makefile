# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gcollet <gcollet@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/22 13:30:58 by gcollet           #+#    #+#              #
#    Updated: 2022/06/22 16:49:07 by gcollet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COUNTAINERS	=	$(eval MY_CONT=$(shell docker ps -a -q))
IMAGES		=	$(eval MY_IMG=$(shell docker images -a -q))
VOLUMES		=	$(eval MY_VOL=$(shell docker volumes ls -q))

all: up

up: 
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

build:
	docker-compose -f srcs/docker-compose.yml build

clean: 
	docker-compose -f srcs/docker-compose.yml down --rmi all

#!WARNING: THIS WILL REMOVE EVERY CONTAINERS, IMAGES AND VOLUMES YOU HAVE
dclean:
	$(COUNTAINERS)
	$(IMAGES)
	$(VOLUMES)
	docker rm -f $(MY_CONT) 2>/dev/null || true
	docker rmi -f $(MY_IMG) || true
	docker volume rm $(MY_CONT) || true

.PHONY: all up down build clean dockerclean