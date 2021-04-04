#!/bin/bash

# +----------------------------+
# | get the SAC file(Mutiply)  |
# +----------------------------+

tmp_fifofile="/tmp/$$.fifo"
mkfifo $tmp_fifofile
exec 6<>$tmp_fifofile
rm -rf $tmp_fifofile

thread=35
for (( i=0;i<$thread;i++ ))
do
    echo ""
done >&6

for seedfile in `ls seed/*.seed`;do
    read -u6
    {
    rdseed -f $seedfile
    echo "">&6
    } &
done

wait
exec 6>$-

exit 0
