#!/bin/csh
foreach file (`ls -d 2012* 2013*`)
   echo $file
   cd $file
   ls *YA*KV*HZ* > temp.txt
   foreach STA (`echo KV01 KV02 KV03 KV04 KV05 KV06 KV07 KV08`)
    echo $STA
    set STANO=`cat temp.txt | grep $STA | awk -F"." '{print $1}'`
    echo $STA $STANO
    mv $STANO.YA.$STA.BHZ.M.SAC $STANO.YA.$STA.HHZ.M.SAC
    mv $STANO.YA.$STA.BHE.M.SAC $STANO.YA.$STA.HHE.M.SAC
    mv $STANO.YA.$STA.BHN.M.SAC $STANO.YA.$STA.HHN.M.SAC
   end
   cd ..
end
 
