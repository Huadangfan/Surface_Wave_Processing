#!/bin/csh
foreach file (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
cd $file/survey2
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
end

