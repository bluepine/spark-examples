#!/bin/bash
while ! nc -z -u fluentd 5140; do
	  sleep 2;
done;
