#!/bin/bash

tmp_fifofile="/tmp/$$.fifo"
mkfifo $tmp_fifofile
exec 6<>$tmp_fifofile
rm -rf $tmp_fifofile

thread=20
for (( i=0;i<$thread;i++ ))
do
    echo ""
done >&6

for file in `ls -d [1,2]*[0,1,2,3,4,5,6,7,8,9]`;do
    read -u6
    {
    echo $file
    cd $file
    rm D*SAC
    cp ./backup_orig/*SAC .
    cd ..
    echo >&6
    }&
done

wait
exec 6>$-

exit 0

