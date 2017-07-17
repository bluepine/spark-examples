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
INSTALL_DIR=/root/install
rm -rf $INSTALL_DIR/*
cmake -DCMAKE_INSTALL_PREFIX:PATH=$INSTALL_DIR . && make all install
rm -rf $INSTALL_DIR/include
sync
