#!/bin/bash

for file in `ls -d [0,1]*`;do
    cd $file
    if [ -d ./survey1 ];then
        cd ./survey1
        mkdir bad_window
        echo "${file}: MKDIR DONE!"
        cd ..
    fi
    cd ..
done
