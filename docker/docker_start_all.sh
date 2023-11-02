#!/bin/sh
# Script for start all existing containers
# Example:
# ./docker_start_all.sh
echo "ALL CONTAINERS: `docker ps -a | grep -v ^CONTAINER | wc -l`"
echo "RUNNING CONTAINERS: `docker ps | grep -v ^CONTAINER | wc -l`"
echo "DOCKER START ALL CONTAINERS..."
docker start `docker ps -a | grep -v ^CONTAINER | awk '{ print $1 }'`
sleep 5
echo "ALL CONTAINERS: `docker ps -a | grep -v ^CONTAINER | wc -l`"
echo "RUNNING CONTAINERS: `docker ps | grep -v ^CONTAINER | wc -l`"
echo DONE.
