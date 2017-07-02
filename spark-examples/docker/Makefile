SHELL:=/bin/bash
all: build-spark-2

build-spark-2:
	docker build -t local/spark-2 --rm=true .
	bash ./clean_up_images.sh
