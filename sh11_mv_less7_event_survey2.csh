#!/bin/csh
foreach file (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
cd $file
mkdir bad_event
mv bad_event/survey2 .
#foreach STA (`cat stadis | awk '{print $1}'`)
#set DISN = `cat stadis | grep $STA | awk '{ print $4 }'`
#set STANET = `cat stadis | grep $STA | awk '{ print $2}'`

cd survey2
set stano1=`ls D*.*HZ.M.SAC | wc -l | tail -1`
echo $stano1
if ($stano1 < 10) then
cd ..
mv survey2 bad_event
cd ..
else
echo "The file list no. is larger than 6"
cd ../..
endif
end

