#!/bin/bash

cat tmp_fevlp_stop.txt | while read line;do
    file=`echo $line | awk -F':' '{print $1}'`
    sta=`echo $line | awk -F':' '{print $3}'`
    echo $file $sta
    cd $file
    if [ ! -d ./bad_data_no_sfcut ];then
       mkdir bad_data_no_sfcut
    fi
    mv *${sta}* ./bad_data_no_sfcut
    cd ..
done
