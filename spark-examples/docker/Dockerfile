FROM frolvlad/alpine-oraclejdk8:slim

MAINTAINER "Song Wei"

### env required for download
ENV HADOOP_VERSION=2.8.0 SPARK_VERSION="2.1.1-bin-hadoop2.7"
ENV USER_CODE=/opt/usr
ENV HADOOP_HOME=$USER_CODE/hadoop-$HADOOP_VERSION \
    SPARK_HOME=$USER_CODE/spark

### Download
COPY copy/root/download.sh /root/download.sh
RUN sh /root/download.sh #avoid re-downloading stuff

### env
ENV USER=hdfsuser
ENV USER_HOME=/home/$USER
ENV USER_DATA=$USER_HOME/.data
ENV USER_CODE_MNT=$USER_CODE/.mnt
ENV USER_TMP=$USER_HOME/tmp
ENV HDFS_VOL1=$USER_DATA/hdfs1 \
    HDFS_VOL2=$USER_DATA/hdfs2 \
    HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop \
    SPARK_CONF_DIR=$SPARK_HOME/etc/ \
    HADOOP_LIBEXEC_DIR=$HADOOP_HOME/libexec \
    SPARK_PUBLIC_DNS=127.0.0.1 \
    PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$USER_CODE/util/bin:$SPARK_HOME/bin:$USER_CODE_MNT:$USER_CODE/bin

### Copy
#COPY volume/artifact $USER_CODE/
COPY copy/root/install /root/install
### Install
RUN sh /root/install/install.sh

### User
USER $USER
#USER root
