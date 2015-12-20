#!/bin/bash

branch="testing"

# Make sure root can not run the script
if [ "$USER" == "root" ]; then
   echo "This script must not be run as root" 1>&2
   exit 1
fi

cd ..
#make clean GLUON_TARGET=x86-generic
#git pull
#make dirclean GLUON_TARGET=x86-generic
#make update
make -j6 GLUON_TARGET=x86-generic GLUON_BRANCH=$branch V=s
make manifest GLUON_BRANCH=$branch
contrib/sign.sh site/secret.key output/images/sysupgrade/$branch.manifest

mkdir -p ../gluon-output/firmware/$branch
cp -ru output/images/* ../gluon-output/firmware/$branch
rm -rf gluon/firmware/$branch/*
