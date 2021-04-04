#!/bin/csh
foreach file (`ls -d [0,1]*`)
if( -d $file/survey1 )then
cd $file/survey1
#   mv bad_data2/* .
   foreach DISN (`cat ../stadis | awk '{print $4}'`)
#   set DISN = `cat stadis | grep $STA | awk '{ print $4 }'`
#   set STANET = `cat stadis | grep $STA | awk '{ print $2}'`
   set stano1=`ls D$DISN.*.*HZ.M.SAC*w | wc -l | tail -1`
   echo $DISN $stano1
        if ($stano1 < 9) then
            mkdir bad_data2 
            mv D$DISN.*.*HZ.M.SAC*w bad_data2
        else
            echo "The file list no. is larger than 5"
        endif
   end
cd ../..
else
 echo "${file}:survey1 not exist"
endif
end

