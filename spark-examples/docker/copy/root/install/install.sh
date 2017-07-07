#!/bin/sh
#installation script used when building docker image. use at most one.
set -x
apk add --no-cache curl netcat-openbsd bash
mkdir -p /opt
adduser -S -D -g "" $USER;
addgroup $USER;
mkdir -p "${HADOOP_HOME}";
export ARCHIVE=hadoop-$HADOOP_VERSION.tar.gz;
export DOWNLOAD_PATH=apache/hadoop/common/hadoop-$HADOOP_VERSION/$ARCHIVE;
curl -sSL https://mirrors.ocf.berkeley.edu/$DOWNLOAD_PATH | tar -xz -C $HADOOP_HOME --strip-components 1;
rm -rf $ARCHIVE;
rm -rf $HADOOP_HOME/share/doc;
cp -r  /root/staging/conf/hadoop/* $HADOOP_CONF_DIR/
mkdir -p $HDFS_VOL1;
mkdir -p $HDFS_VOL2;

SPARK_ARCHIVE=https://d3kbcqa49mib13.cloudfront.net/spark-${SPARK_VERSION}.tgz
mkdir -p $USER_CODE;
curl -s $SPARK_ARCHIVE | tar -xz -C $USER_CODE && ln -sf $USER_CODE/spark-${SPARK_VERSION} $SPARK_HOME
cp -r  /root/staging/conf/spark/* $SPARK_HOME/etc/

rm -rf /root/staging
#assume all directories owned by $USER are inside $USER_HOME
chown -R $USER:$USER $USER_HOME;
sync
