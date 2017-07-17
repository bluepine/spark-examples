#!/bin/bash
hadoop fs -mkdir -p /eventLogging
hadoop fs -mkdir -p /historyEventLogging
bash $SPARK_HOME/sbin/start-history-server.sh
hadoop fs -put $USER_CODE_MNT/data /data
hadoop fs -mkdir /code
hadoop fs -put $USER_CODE_MNT/spark-examples-1.0.jar /code/spark-examples-1.jar
for class in examples.classification.BikeBuyersDTree examples.classification.BikeBuyersDTreeTuning examples.classification.BikeBuyersRForest examples.classification.BikeBuyersRForestTuning examples.classification.NaiveBayesTfIdfSpamClassifier examples.regression.HousePricesPrediction examples.classification.BikeBuyersDTreeJava examples.classification.BikeBuyersRForestJava examples.classification.NaiveBayesTfIdfSpamClassifierJava examples.regression.HousePricesPredictionJava
do
    spark-submit --class $class --deploy-mode cluster --master spark://spark-master:6066 hdfs://spark-master:8020/code/spark-examples-1.jar hdfs://spark-master:8020/data
done

