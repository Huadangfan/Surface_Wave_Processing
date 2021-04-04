#!/bin/csh
rm temp1.txt temp2.txt 
foreach file (`ls -d 1* 2*`)
echo $file
cd $file 
echo $file >> ../temp1.txt
ls *HZ*SAC | wc -l >> ../temp2.txt
cd ..
end
paste temp1.txt temp2.txt > station_no.events.dat


