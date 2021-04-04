#!/bin/bash

rm tmp_NAN_sacfile_love.txt

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
    #echo $file
    for sacfile in `ls *BHT*SAC`;do
        echo "${file} ${sacfile} normal!"
        depmen=`saclst DEPMEN f $sacfile`
        middle=`echo $depmen | awk '{print $2}'`
        #echo $file $sacfile $middle
        if [[ $(echo $middle | awk -F'n' '{print $2}' ) == "a" ]];then
            echo "${file} ${sacfile} abnormal! ${middle}"
            stationname=`echo $sacfile | awk -F'.' '{print $3}'`
            net=`echo $sacfile | awk -F'.' '{print $2}'`
            echo "mv ./$file/*${net}.${stationname}* ./$file/bad_data" >> ../tmp_NAN_sacfile_love.txt
        fi
    done
    cd ..
    echo >&6
    }&
done

wait
exec 6>$-
exit 0
