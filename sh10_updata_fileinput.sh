#!/bin/bash

tmp_fifofile="/tmp/$$.fifo"
mkfifo $tmp_fifofile
exec 6<>$tmp_fifofile
rm -rf $tmp_fifofile

thread=200
for (( i=0;i<$thread;i++ ))
do
    echo "" 
done >&6

for file in `ls -d [0,1]*`;do
    read -u6
    {
    cd $file
    ls *BHZ*SAC | wc -l > file_rayleigh.in
    ls *BHZ*SAC >> file_rayleigh.in
    echo $file $(ls *BHZ*SAC | wc -l)
    cd ..
    echo >&6
    }&
done

wait
exec 6>$-
exit 0
