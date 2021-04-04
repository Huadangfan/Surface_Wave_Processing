#!/bin/bash

cp ./zero_time_crrt_precode/[1,2]*.sfcut.m .

rm tmp_no_sfcut.txt

for file in `ls -d [1,2]*.*.*[0,1,2,3,4,5,6,7,8,9]`;do
    ttime=`echo $file | awk -F'.' '{print $1$2$3}'`
    # echo ${ttime}
    if [ -f ${ttime}.sfcut.m ];then
        echo $file
        cp ${ttime}.sfcut.m $file
        cd $file
sac <<EOF
m ${ttime}.sfcut.m
quit
EOF
    cd ..
    else
        echo "$file\ no_sfcut"
        echo "mv $file bad_data" >> tmp_no_sfcut.txt
    fi
done

rm [1,2]*.sfcut.m
