#!/bin/bash
. build.sh
#docker-compose down
docker stack rm $STACK
