#!/bin/sh
# Script for remove all containers (force)
# Example:
# ./docker_rm_all.sh
echo "CONTAINERS: `docker ps -a | grep -v ^CONTAINER | wc -l`"
echo "DOCKER REMOVE ALL CONTAINERS (FORCE) AFTER 5 SECONDS..."
sleep 5
docker rm -f `docker ps -a | grep -v ^CONTAINER | awk '{ print $1 }'`
echo "CONTAINERS: `docker ps -a | grep -v ^CONTAINER | wc -l`"
echo DONE.
