#!/bin/csh
foreach file (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
cd $file/survey2
#foreach STA (`cat stadis | awk '{print $1}'`)
#set DISN = `cat stadis | grep $STA | awk '{ print $4 }'`
#set STANET = `cat stadis | grep $STA | awk '{ print $2}'`

set stano1=`ls *.*HZ.M.SAC.f006.w | wc -l | tail -1`
echo $stano1
if ($stano1  < 10) then 
mkdir bad_data2
mv *.*HZ.M.SAC.f006.w bad_data2/
else
echo "The file list no. is larger than 6"
endif


set stano1=`ls *.*HZ.M.SAC.f007.w | wc -l | tail -1`
echo $stano1
if ($stano1  < 10) then 
mkdir bad_data2
mv *.*HZ.M.SAC.f007.w bad_data2/
else
echo "The file list no. is larger than 6"
endif

set stano1=`ls *.*HZ.M.SAC.f008.w | wc -l | tail -1`
echo $stano1
if ($stano1  < 10) then 
mkdir bad_data2
mv *.*HZ.M.SAC.f008.w bad_data2/
else
echo "The file list no. is larger than 6"
endif

set stano1=`ls *.*HZ.M.SAC.f009.w | wc -l | tail -1`
echo $stano1
if ($stano1  < 10) then 
mkdir bad_data2
mv *.*HZ.M.SAC.f009.w bad_data2/
else
echo "The file list no. is larger than 6"
endif

set stano1=`ls *.*HZ.M.SAC.f010.w | wc -l | tail -1`
echo $stano1
if ($stano1  < 10) then 
mkdir bad_data2
mv *.*HZ.M.SAC.f010.w bad_data2/
else
echo "The file list no. is larger than 6"
endif

set stano1=`ls *.*HZ.M.SAC.f012.w | wc -l | tail -1`
echo $stano1
if ($stano1  < 10) then 
mkdir bad_data2
mv *.*HZ.M.SAC.f012.w bad_data2/
else
echo "The file list no. is larger than 6"
endif

set stano1=`ls *.*HZ.M.SAC.f013.w | wc -l | tail -1`
echo $stano1
if ($stano1  < 10) then 
mkdir bad_data2
mv *.*HZ.M.SAC.f013.w bad_data2/
else
echo "The file list no. is larger than 6"
endif

set stano1=`ls *.*HZ.M.SAC.f015.w | wc -l | tail -1`
echo $stano1
if ($stano1  < 10) then 
mkdir bad_data2
mv *.*HZ.M.SAC.f015.w bad_data2/
else
echo "The file list no. is larger than 6"
endif

set stano1=`ls *.*HZ.M.SAC.f017.w | wc -l | tail -1`
echo $stano1
if ($stano1  < 10) then 
mkdir bad_data2
mv *.*HZ.M.SAC.f017.w bad_data2/
else
echo "The file list no. is larger than 6"
endif

set stano1=`ls *.*HZ.M.SAC.f020.w | wc -l | tail -1`
echo $stano1
if ($stano1  < 10) then 
mkdir bad_data2
mv *.*HZ.M.SAC.f020.w bad_data2/
else
echo "The file list no. is larger than 6"
endif

set stano1=`ls *.*HZ.M.SAC.f022.w | wc -l | tail -1`
echo $stano1
if ($stano1  < 10) then 
mkdir bad_data2
mv *.*HZ.M.SAC.f022.w bad_data2/
else
echo "The file list no. is larger than 6"
endif

set stano1=`ls *.*HZ.M.SAC.f025.w | wc -l | tail -1`
echo $stano1
if ($stano1  < 10) then 
mkdir bad_data2
mv *.*HZ.M.SAC.f025.w bad_data2/
else
echo "The file list no. is larger than 6"
endif

set stano1=`ls *.*HZ.M.SAC.f029.w | wc -l | tail -1`
echo $stano1
if ($stano1  < 10) then 
mkdir bad_data2
mv *.*HZ.M.SAC.f029.w bad_data2/
else
echo "The file list no. is larger than 6"
endif

set stano1=`ls *.*HZ.M.SAC.f033.w | wc -l | tail -1`
echo $stano1
if ($stano1  < 10) then 
mkdir bad_data2
mv *.*HZ.M.SAC.f033.w bad_data2/
else
echo "The file list no. is larger than 6"
endif

set stano1=`ls *.*HZ.M.SAC.f033.w | wc -l | tail -1`
echo $stano1
if ($stano1  < 10) then 
mkdir bad_data2
mv *.*HZ.M.SAC.f033.w bad_data2/
else
echo "The file list no. is larger than 6"
endif

set stano1=`ls *.*HZ.M.SAC.f037.w | wc -l | tail -1`
echo $stano1
if ($stano1  < 10) then 
mkdir bad_data2
mv *.*HZ.M.SAC.f037.w bad_data2/
else
echo "The file list no. is larger than 6"
endif

set stano1=`ls *.*HZ.M.SAC.f040.w | wc -l | tail -1`
echo $stano1
if ($stano1  < 10) then 
mkdir bad_data2
mv *.*HZ.M.SAC.f040.w bad_data2/
else
echo "The file list no. is larger than 6"
endif

set stano1=`ls *.*HZ.M.SAC.f045.w | wc -l | tail -1`
echo $stano1
if ($stano1  < 10) then 
mkdir bad_data2
mv *.*HZ.M.SAC.f045.w bad_data2/
else
echo "The file list no. is larger than 6"
endif

set stano1=`ls *.*HZ.M.SAC.f050.w | wc -l | tail -1`
echo $stano1
if ($stano1  < 10) then 
mkdir bad_data2
mv *.*HZ.M.SAC.f050.w bad_data2/
else
echo "The file list no. is larger than 6"
endif

cd ../..
end
#set stano=`ls -I "*H1*" -I "*H2*" -I "*HE*" -I "*HN*" -I "*SRDT*"`
