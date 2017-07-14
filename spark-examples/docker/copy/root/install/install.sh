#!/bin/sh
#installation script used when building docker image. use at most one.
set -x
mkdir -p /opt
adduser -S -D -g "" $USER;
addgroup $USER;
cp -r  /root/install/conf/hadoop/* $HADOOP_CONF_DIR/
mkdir -p $HDFS_VOL1;
mkdir -p $HDFS_VOL2;

mkdir -p $SPARK_CONF_DIR
cp -r  /root/install/conf/spark/* $SPARK_CONF_DIR
mkdir $USER_TMP
#assume all directories owned by $USER are inside $USER_HOME
chown -R $USER:$USER $USER_HOME;
sync
