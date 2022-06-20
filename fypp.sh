#!/bin/bash

set -x
set -e

cd fypp


b=gprcp_ydvars

/opt/softs/anaconda3/bin/fypp -m os -M . -m yaml -m field_config ./$b.fypp  > $b.F90

d=adiab

if [ ! -f ../src/local/arpifs/$d/$b.F90 ]
then
  cp $b.F90 ../src/local/arpifs/$d/$b.F90
else
  set +e
  cmp $b.F90 ../src/local/arpifs/$d/$b.F90
  c=$?
  set -e
  if [ $c -ne 0 ]
  then
    cp $b.F90 ../src/local/arpifs/$d/$b.F90
  fi
fi

