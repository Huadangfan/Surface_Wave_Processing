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
    echo $file
    dnum=`ls *BHZ*SAC | awk -F'.' '{print $1}' | awk -F'D' '{print $2}' | sort -n | tail -1`
    echo "${dnum}*BHZ.M.SAC > file_sta_input.d"
    ls D${dnum}*BHZ.M.SAC > file_sta_input.d
    cd ..
    echo >&6
    }&
done
wait
exec 6>$-
exit 0
