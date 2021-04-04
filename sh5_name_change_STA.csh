#!/bin/csh

# +----------------------+
# | $2: decied to backup |
# +----------------------+

foreach file (`ls -d $1`)
cd $file
if ( -d ./backup_orig) then
else
    mkdir backup_orig
endif

if ($2>0) then
  echo "BACKUP THE SAC FILES: BEGIN"
  cp 2*.SAC 1*.SAC backup_orig/
  echo "BACKUP DONE!"
endif
#if (-d ./backup_orig) then
#    cp ./backup_orig/* .
#    else
#    mkdir backup_orig
#endif

foreach STA (`cat stadis | awk '{print $1}'`)
    set DISN = `cat stadis | grep -m 1 $STA | awk '{ print $4 }'`
    set STANET = `cat stadis | grep -m 1 $STA | awk '{ print $2}'`

    set filenoone=`ls *.$STANET.$STA*.*HZ.*.SAC | wc -l`
    echo $filenoone
if ($filenoone>1) then
    mkdir repeat_STA
    mv *.$STANET.$STA*.*HZ.*.SAC repeat_STA
else
    mv *.$STANET.$STA*.*HZ.*.SAC D$DISN.$STANET.$STA.BHZ.M.SAC
endif

    set filenotwo=`ls *.$STANET.$STA*.*HE.*.SAC | wc -l`
    echo $filenotwo
if ($filenotwo>1) then
    mkdir repeat_STA
    mv *.$STANET.$STA*.*HE.*.SAC repeat_STA
else
    mv *.$STANET.$STA*.*HE.*.SAC D$DISN.$STANET.$STA.BHE.M.SAC
endif


    set filenothree=`ls *.$STANET.$STA*.*HN.*.SAC | wc -l`
    echo $filenothree
if ($filenothree>1) then
    mkdir repeat_STA
    mv *.$STANET.$STA*.*HN.*.SAC repeat_STA
else
    mv *.$STANET.$STA*.*HN.*.SAC D$DISN.$STANET.$STA.BHN.M.SAC
endif

end
#mv 2*.SAC 1*.SAC backup_orig
cd ..
end


