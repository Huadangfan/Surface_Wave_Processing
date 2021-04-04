#!/bin/csh
set survey = "survey1"
foreach STA (`cat $survey.dat | awk '{print $2}'`)
    echo $STA
    foreach event (`ls -d $1`)
        echo $event
        cd $event
        if ( ! -d $survey )then
            mkdir $survey
            echo "MKDIR DONE"
        endif
        cp *$STA.*SAC *$STA.*.w  $survey
        echo "COPY DONE"
        cd ..
    end
end
