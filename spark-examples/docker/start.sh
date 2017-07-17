#!/bin/bash
. build.sh
bash ./stop.sh
#docker-compose up
docker stack deploy --compose-file=docker-compose.yml $STACK
