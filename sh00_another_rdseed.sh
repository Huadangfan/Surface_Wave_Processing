#!/bin/bash

# +----------------------------+
# | get the SAC file(Mutiply)  |
# +----------------------------+
cd seed
for seedfile in `ls *.seed`;do
{
rdseed -d -f $seedfile -q ..
}&
done
wait
cd ..
exit 0
