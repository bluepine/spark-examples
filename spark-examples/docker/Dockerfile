FROM frolvlad/alpine-oraclejdk8:slim

MAINTAINER "Song Wei"

### env required for download
ENV HADOOP_VERSION=2.8.0 SPARK_VERSION="2.1.1-bin-hadoop2.7"
ENV USER_CODE=/opt/usr
ENV HADOOP_HOME=$USER_CODE/hadoop-$HADOOP_VERSION \
    SPARK_HOME=$USER_CODE/spark

### Download
COPY copy/root/download.sh /root/download.sh
RUN sh /root/download.sh #edit this line when you need to invalidate cache for this command

### env
ENV USER=hdfsuser
ENV USER_HOME=/home/$USER
ENV USER_DATA=$USER_HOME/.data \
    USER_CONF=/opt/etc \
    USER_CODE_MNT=$USER_CODE/.mnt \
    USER_TMP=$USER_HOME/tmp

#hadoop env
ENV HADOOP_CONF_DIR=$USER_CONF/hadoop \
    HDFS_VOL1=$USER_DATA/hdfs1 \
    HDFS_VOL2=$USER_DATA/hdfs2 \
    HADOOP_LIBEXEC_DIR=$HADOOP_HOME/libexec

#spark env
ENV SPARK_CONF_DIR=$USER_CONF/spark \
    SPARK_PUBLIC_DNS=127.0.0.1 \
    SPARK_WORKER_DIR=$USER_TMP/spark-work \
    SPARK_LOCAL_DIRS=$USER_TMP/spark-tmp \
    SPARK_PID_DIR=$USER_TMP/spark_pid \
    SPARK_LOG_DIR=$USER_TMP/spark_log


ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$USER_CODE/util/bin:$SPARK_HOME/bin:$USER_CODE_MNT:$USER_CODE/bin
ENV LD_LIBRARY_PATH=$HADOOP_HOME/lib/native
### Copy
#COPY volume/artifact $USER_CODE/
COPY copy/root/install /root/install
### Install
RUN sh /root/install/install.sh #edit this line when you need to invalidate cache for this command

### User
USER $USER
#USER root
