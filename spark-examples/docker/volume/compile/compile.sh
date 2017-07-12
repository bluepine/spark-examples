#!/bin/bash
set -x
cd /root
rm -rf compile
mkdir -p compile
cd compile

wget http://fluentbit.io/releases/0.11/fluent-bit-0.11.13.tar.gz
tar xf fluent-bit-0.11.13.tar.gz
cd fluent-bit-0.11.13
apk update
apk add make cmake
rm -rf /root/install/*
cmake -DCMAKE_INSTALL_PREFIX:PATH=/root/install . && make all install
sync
