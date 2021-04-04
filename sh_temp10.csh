#!/bin/csh
foreach file (`ls -d 0* 1*`)
cd $file 
   if (-d survey1) then
    cd ../for_Li_L
    mkdir $file
    cp -rf ../$file/survey1/*HT*f*w ./$file
    cd ..
   else
    echo $file
    cd ..
   endif
end

