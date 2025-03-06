#!/bin/bash

echo "--- Docker System Status ---"
echo "Docker Service Autostart:"
systemctl is-enabled docker

echo "\n--- Running Containers ---"
docker ps

echo "\n--- All Containers (including stopped) ---"
docker ps -a

echo "\n--- Images ---"
docker images

echo "\n--- Networks ---"
docker network ls

echo "\n--- Volumes ---"
docker volume ls

echo "\n--- Dangling Images ---"
docker images --filter "dangling=true"

echo "\n--- Exited Containers ---"
docker ps -a --filter "status=exited"

echo "\n--- Dangling Volumes ---"
docker volume ls --filter dangling=true

echo "\n--- Docker Stats (Running Containers) ---"
docker stats --no-stream

