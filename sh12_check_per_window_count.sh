#!/bin/bash

for file in `ls -d [0,1]*`;do
  cd $file
  if [ -d ./survey1 ];then
    cd survey1
    f020count=`ls *f020.w | wc -l`
    f010count=`ls *f010.w | wc -l`
    echo "-------------------"
    echo $file
    echo "f020: ${f020count}"
    echo "f010: ${f010count}"
    echo "-------------------"
    cd ..
  else
    echo "-------------------" 
    echo "None f010 and f020"
    echo "-------------------" 
  fi
  cd ..
done
