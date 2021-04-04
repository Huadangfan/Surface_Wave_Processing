#!/bin/csh
foreach file (`ls -d 1* 2*`)
cd $file
rm temp1.txt temp2.txt temp3.txt temp4.txt temp5.txt temp6.txt
saclst GCARC f *HZ* | sort -k2 -n | cat -n | awk '{printf("%0.2d\n",$1)}'  > temp1.txt
saclst GCARC f *HZ* | sort -k2 -n > temp2.txt
paste temp1.txt temp2.txt > temp3.txt
#awk '{print $2}' temp3.txt | awk -F'.' '{printf"%s\n",$8}' > temp4.txt
awk '{print $2}' temp3.txt | awk -F'.' '{printf"%s\n",$8}' > temp4.txt
awk '{print $2}' temp3.txt | awk -F'.' '{printf"%s\n",$7}' > temp5.txt 
paste temp4.txt temp5.txt temp3.txt > temp6.txt
awk '{print $1,$2,$5,$3}' temp6.txt > stadis

#rm temp1.txt temp2.txt temp3.txt temp4.txt temp5.txt temp6.txt
cd ..
end
