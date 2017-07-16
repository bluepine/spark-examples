#!/bin/bash
bash $SPARK_HOME/sbin/start-history-server.sh
for class in examples.classification.BikeBuyersDTree examples.classification.BikeBuyersDTreeTuning examples.classification.BikeBuyersRForest examples.classification.BikeBuyersRForestTuning examples.classification.NaiveBayesTfIdfSpamClassifier examples.regression.HousePricesPrediction examples.classification.BikeBuyersDTreeJava examples.classification.BikeBuyersRForestJava examples.classification.NaiveBayesTfIdfSpamClassifierJava examples.regression.HousePricesPredictionJava
do
    bin/spark-submit --class $class --deploy-mode cluster --master spark://spark-master:6066 /shared/jar/spark-examples-1.0.jar /tmp/data/
done

