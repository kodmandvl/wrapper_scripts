#!/bin/sh
# Script for clear docker build cache
# Example:
# ./docker_clear_build_cache.sh
echo "DOCKER CLEAR BUILD CACHE AFTER 5 SECONDS..."
echo "docker buildx prune -a -f"
sleep 5
docker buildx prune -a -f
echo DONE.
