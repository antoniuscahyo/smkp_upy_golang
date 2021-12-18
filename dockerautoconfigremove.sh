#!/bin/bash
docker-compose down --remove-orphans --volumes

docker rmi $(docker images | grep 'image-smkp-upy')