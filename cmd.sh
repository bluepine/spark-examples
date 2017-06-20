#command: bash /shared/sh/test.sh

spark-submit --class examples.regression.HousePricesPredictionJava --deploy-mode cluster --master spark://spark-master:6066 ./spark-examples-1.0.jar /tmp/data/
