#!/bin/bash
set -x
image=frolvlad/alpine-gxx
install_v=`pwd`/volume/artifact
mkdir -p $install_v 
#docker pull $image
docker run -v `pwd`/volume/compile/compile.sh:/root/compile.sh:ro -v $install_v:/root/install --rm $image sh /root/compile.sh
