#!/bin/csh

rm tmp_no_sfcut.txt

foreach file (`ls -d [1,2]*.*.*[0,1,2,3,4,5,6,7,8,9]`)
set yesr = `echo $file | awk -F'.' '{print $1$2$3}'`
if (-f $yesr.sfcut.m) then
    echo $file
    cp $file.sfcut.m $file
    cd $file
sac << EOF
m $file.sfcut.m
quit
EOF
    cd ..
else
    echo "$file\ no_sfcut"
    echo "mv $file bad_data" >> tmp_no_sfcut.txt
endif
end
