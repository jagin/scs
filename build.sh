#!/usr/bin/env bash
set -e

build () {
  echo "Building $1 ..."
  cd ./$1
  docker build -t $1 .
  cd ..
}

if [ $# -eq 0 ]; then
  build "home-scs"
  build "items-scs"
  build "account-scs"
else
  for scs in "$@"; do
    build $scs
  done
fi
