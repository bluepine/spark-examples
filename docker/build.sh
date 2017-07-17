#!/bin/bash
STACK=spark
TAG=local/spark-2
function extract_env {
    docker run --rm $TAG sh -c 'echo $'${1}
}
docker build -t $TAG --rm=true .
bash ./clean_up_images.sh
export HDFS_VOL1=`extract_env HDFS_VOL1`
export HDFS_VOL2=`extract_env HDFS_VOL2`
export USER_TMP=`extract_env USER_TMP`
export USER_CODE_MNT=`extract_env USER_CODE_MNT`
export SPARK_CONF_DIR=`extract_env SPARK_CONF_DIR`
export HADOOP_CONF_DIR=`extract_env HADOOP_CONF_DIR`
