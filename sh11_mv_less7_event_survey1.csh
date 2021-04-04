#!/bin/csh
foreach file (`ls -d [0,1]*`)
cd $file
mkdir bad_event
mv bad_event/survey1 .
#foreach STA (`cat stadis | awk '{print $1}'`)
#set DISN = `cat stadis | grep $STA | awk '{ print $4 }'`
#set STANET = `cat stadis | grep $STA | awk '{ print $2}'`

cd survey1
set stano1=`ls D*.*HZ.M.SAC | wc -l | tail -1`
echo $stano1
if ($stano1 < 8) then
cd ..
mv survey1 bad_event
cd ..
else
echo "The file list no. is larger than 6"
cd ../..
endif
end

