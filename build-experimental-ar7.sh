#!/bin/bash

cd ..

#make clean GLUON_TARGET=ar71xx-generic
#git pull
#make dirclean GLUON_TARGET=ar71xx-generic
#make update
make -j4 GLUON_TARGET=ar71xx-generic GLUON_BRANCH=experimental V=s
make manifest GLUON_BRANCH=experimental
contrib/sign.sh site/secret.key images/sysupgrade/experimental.manifest

#rm -rf /home/james/gluon/firmware/experimental
cp -r images /home/james/gluon-output/firmware/experimental