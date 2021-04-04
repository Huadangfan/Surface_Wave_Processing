#!/bin/bash

for file in `ls survey1_filelist_R_f0??.dat`;do
    num=`cat $file | grep w$ | wc -l`
    echo $file\ $num
done
echo "------------------"
for file in `ls survey1_filelist_L_f0??.dat`;do
    num=`cat $file | grep w$ | wc -l`
    echo $file\ $num
done

