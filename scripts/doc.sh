#!/bin/bash

src=$1
dest=$2

if ! [ `which ronn` ]; then
  echo 'ronn rubygem is not installed, run "gem install ronn"'
  exit 0
fi

mkdir -p $(dirname $dest)

# VERSION=$(grep version package.json | perl -pi -e 's/[^-\d\.]//g')

case $dest in
  *.[13])
    ronn --roff $1 --pipe --organization=1602\ Software --manual=CompoundJS > $2
    exit $?
    ;;

  *.html)
    ronn -5 $1 --pipe\
      --style=toc\
      --organization=1602\ Software\
      --manual=CompoundJS > $2
    exit $?
    ;;
esac
