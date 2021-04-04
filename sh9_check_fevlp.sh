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

rm tmp_fevlp_stop.txt
for file in `ls -d [1,2]*`;do
    read -u6
    {
    cd $file
        for sacfile in `ls D*BHZ*SAC`;do
            if [ ! -f ${sacfile}.f006 ]; then
                staname=`echo $sacfile | awk -F'.' '{print $3}'`
                npts=`saclst NPTS f $sacfile | awk '{print $2}'`
                echo "${file}:\ fevlp STOP! Station:${staname}:\ ${npts}"
                #npts=`saclst NPTS f $sacfile | awk '{print $2}'`
                echo "${file}:\ fevlp STOP! Station:${staname}:\ ${npts}" >> ../tmp_fevlp_stop.txt
                #break
            fi
        done
    cd ..
    echo >&6
    }&
done

wait
exec 6>$-

exit 0
