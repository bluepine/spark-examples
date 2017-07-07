FROM local/hadoop-2

MAINTAINER "Song Wei"

ENV SPARK_HOME=$USER_CODE/spark \
    SPARK_VERSION="2.1.1-bin-hadoop2.7"
ENV PATH="${SPARK_HOME}/bin:${PATH}"

# SPARK
ARG SPARK_ARCHIVE=https://d3kbcqa49mib13.cloudfront.net/spark-${SPARK_VERSION}.tgz
USER $USER
RUN curl -s $SPARK_ARCHIVE | tar -xz -C $USER_CODE && ln -sf $USER_CODE/spark-${SPARK_VERSION} $SPARK_HOME && sync

# COPY ha.conf $SPARK_HOME/conf

# EXPOSE 4040 6066 7077 8080

WORKDIR $SPARK_HOME


