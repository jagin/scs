#!/bin/sh
set -e

build () {
  echo "Building $1 ..."
  cd ../$1-scs
  docker build -t $1-scs .
}

if [ $# -eq 0 ]; then
  build "home"
  build "items"
  build "account"
else
  for scs in "$@"; do
    build $scs
  done
fi

cd ../scs-proxy
