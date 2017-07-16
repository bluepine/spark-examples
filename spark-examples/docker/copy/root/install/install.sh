#!/bin/sh
#installation script used when building docker image. use at most one.
set -x
mkdir -p /opt
adduser -S -D -g "" $USER;
addgroup $USER;
mkdir -p $HDFS_VOL1;
mkdir -p $HDFS_VOL2;

mkdir -p $SPARK_CONF_DIR
echo $USER_HOME
mkdir $USER_TMP
#assume all directories owned by $USER are inside $USER_HOME
chown -R $USER:$USER $USER_HOME;
sync
