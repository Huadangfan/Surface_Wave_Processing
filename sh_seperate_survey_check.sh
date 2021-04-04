#!/bin/bash

function is_empty_dir(){
  return `ls -A $1 | wc -w`
}

for file in `ls -d [0,1]*`;do
  if is_empty_dir $file/survey1;then
    continue
  else
    cd $file/survey1
    num=`ls *w | wc -l`
    echo $file\ $num
    cd ../..
  fi
done
