#!/bin/bash

tmp_fifofile="/tmp/$$.fifo"
mkfifo $tmp_fifofile
exec 6<>$tmp_fifofile
rm -rf $tmp_fifofile

thread=35
for (( i=0;i<$thread;i++ ))
do
    echo ""
done >&6

for file in `ls -d [1,2]*[0,1,2,3,4,5,6,7,8,9]`;do
  read -u6
  {
  cd $file
  echo $file
  saclst KCMPNM f *SAC > tmp_saclst.txt
  cat tmp_saclst.txt | while read line;do
    kcmpnm=`echo $line | awk '{print $2}'`
    sacfile=`echo $line | awk '{print $1}'`
    if [[ "$kcmpnm" == "HHE" || "$kcmpnm" == "HHN" || "$kcmpnm" == "HHZ" ]]
    then
      echo ${file}/${sacfile}:\ ${kcmpnm}
    #else
      #echo "${sacfile}:\ NONE HH*"
    fi
  done
  cd ..
  echo >&6
  }&
done

wait
exec 6>$-

exit 0
