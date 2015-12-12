#!/bin/bash

cd ..
#make clean GLUON_TARGET=x86-generic
#git pull
#make dirclean GLUON_TARGET=x86-generic
#make update
make -j4 GLUON_TARGET=x86-generic GLUON_BRANCH=experimental V=s
make manifest GLUON_BRANCH=experimental
contrib/sign.sh site/secret.key output/images/sysupgrade/experimental.manifest

#rm -rf /home/james/gluon/firmware/experimental
#cp -r images /home/james/gluon/firmware/experimental
