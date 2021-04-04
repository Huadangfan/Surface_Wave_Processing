#!/bin/csh
foreach file (`ls -d 1* 2*`)
    echo $file
    cd $file 
    set stano=`ls *HZ*SAC | wc -l`
        if ($stano < 7) then
            cd ..
            mv $file bad_data
        else
            echo "The file list no. is larger than 7"
            cd ..
        endif
end


