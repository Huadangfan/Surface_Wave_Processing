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
    ls *BHT*SAC | wc -l > file_love.in
    ls *BHT*SAC >> file_love.in
    echo $file $(ls *BHT*SAC | wc -l)
    cd ..
    echo >&6
    }&
done

wait
exec 6>$-
exit 0
