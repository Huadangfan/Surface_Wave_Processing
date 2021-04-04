#!/bin/bash

tmp_fifofile="/tmp/$$.fifo"
mkfifo $tmp_fifofile
exec 6<>$tmp_fifofile
rm -rf $tmp_fifofile

thread=100
for (( i=0;i<$thread;i++ ))
do
        echo ""
done >&6

for file in `ls -d 0* 1*`;do
    read -u6
    {
    cd $file
    if [ -d ./survey1 ];then
        cd ./survey1
        for sacfile in `ls *SAC*`;do
            stnm=`saclst kstnm f $sacfile | awk '{print $2}'`
            stnm_filename=`echo $sacfile | awk -F'.' '{print $3}'`
            if [[ "${stnm_filename}" == "${stnm}"  ]];then
               # echo "EQUAL"
               :
            else
                #echo $sacfile > tmp_test
                #cat tmp_test | sed 's/$stnm_filename/$stnm/g' > tmp_testt
                newname=`echo $sacfile | sed "s/$stnm_filename/$stnm/g"`
                #newname=`cat tmp_testt | head -1`
                #echo $sacfile | awk -F"$stnm_filename" '{print $1}'
                #file_suf=`echo $sacfile | awk -F'$stnm_filename' '{print $2}'`
                #echo $file_pro
                #newname=`echo ${file_pro}${stnm}`
                #echo $newname
                echo "old:${file}/survey1/${sacfile} | new:${newname} | $stnm_filename | $stnm"
                mv $sacfile $newname
            fi
        done
        cd ..
    fi
    cd ..
    echo >&6
    }&
done

wait
exec 6>$-
exit 0
