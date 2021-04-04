#!/bin/csh
foreach file (`ls -d *200*`)
cd $file
   foreach DISN (`cat stadis | awk '{print $4}'`)
#   set DISN = `cat stadis | grep $STA | awk '{ print $4 }'`
#   set STANET = `cat stadis | grep $STA | awk '{ print $2}'`
   set stano1=`ls D$DISN.*.BHT.M.SAC*w | wc -l`
   echo $DISN $stano1
        if ($stano1 < 6) then
            mkdir bad_data2 
            mv D$DISN.*.BHT.M.SAC*w bad_data2
        else
            echo "The file list no. is larger than 5"
        endif
   end
cd ..
end

