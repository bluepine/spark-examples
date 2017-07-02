#!/bin/bash
bash ./stop.sh
sudo rm -rf ./shared/log
make
mkdir -p ./shared/log
docker-compose up
