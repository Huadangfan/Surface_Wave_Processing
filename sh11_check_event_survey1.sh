#!/bin/bash

for file in `ls -d [0,1]*`;do
  cd $file
  if [ -d ./survey1 ];then
    num=$(ls survey1/*HZ*SAC | wc -l)
    echo $file\ $num
  fi
  cd ..
done
