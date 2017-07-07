#!/bin/sh
#download script used when building docker image. use at most one.
apk add --no-cache curl netcat-openbsd bash
export ARCHIVE=hadoop-$HADOOP_VERSION.tar.gz;
export DOWNLOAD_PATH=apache/hadoop/common/hadoop-$HADOOP_VERSION/$ARCHIVE;
curl -sSL https://mirrors.ocf.berkeley.edu/$DOWNLOAD_PATH | tar -xz -C $HADOOP_HOME --strip-components 1;
rm -rf $ARCHIVE;
rm -rf $HADOOP_HOME/share/doc;

SPARK_ARCHIVE=https://d3kbcqa49mib13.cloudfront.net/spark-${SPARK_VERSION}.tgz
mkdir -p $USER_CODE;
curl -s $SPARK_ARCHIVE | tar -xz -C $USER_CODE && ln -sf $USER_CODE/spark-${SPARK_VERSION} $SPARK_HOME
