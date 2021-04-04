#!/bin/csh
foreach file (`ls -d *200*`)
cd $file
#foreach STA (`cat stadis | awk '{print $1}'`)
#set DISN = `cat stadis | grep $STA | awk '{ print $4 }'`
#set STANET = `cat stadis | grep $STA | awk '{ print $2}'`

set stano1=`ls D*.BHT.M.SAC | wc -l`
echo $stano1
if ($stano1 < 10) then
cd ..
mv $file bad_event
else
echo "The file list no. is larger than 6"
cd ..
endif
end

