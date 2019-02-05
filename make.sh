#!/bin/bash

cd $(dirname "$0")

CD=$(pwd)

rm -r tmp
mkdir -p tmp

curl -f "https://www.openssl.org/source/openssl-1.1.0j.tar.gz" -o "./tmp/openssl.tar.gz"

if [ $? -ne 0 ]; then
  echo "error download openssl"
  exit 1
fi

tar -xf ./tmp/openssl.tar.gz  --directory ./tmp
rm ./tmp/openssl.tar.gz
mv ./tmp/openssl* ./tmp/openssl

PREFIX="/tmp/openssl-frefix" 

rm -r $PREFIX 
mkdir $PREFIX 

cd ./tmp/openssl

./Configure linux-x86_64 --openssldir=$PREFIX --prefix=$PREFIX  -fPIC
#make depend
make
make install_sw

cd $CD

rm -r "$CD/linux-x86_64"
mv $PREFIX  "$CD/linux-x86_64"

rm -r $PREFIX