#!/bin/csh
#foreach STA (`cat survey1.dat | awk '{print $2}'`)
#    echo $STA
    foreach event (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
        echo $event
        cd $event
        mkdir survey2
#        cp *$STA.*SAC *$STA.*.w  survey1
        cd ..
    end
#end
