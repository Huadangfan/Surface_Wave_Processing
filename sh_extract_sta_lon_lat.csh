#!/bin/csh
rm temp.txt
saclst stla stlo f *1997*/*HZ*SAC > temp.txt
saclst stla stlo f *1998*/*HZ*SAC >> temp.txt
saclst stla stlo f *1999*/*HZ*SAC >> temp.txt
saclst stla stlo f *2001*/*HZ*SAC >> temp.txt
saclst stla stlo f *2002*/*HZ*SAC >> temp.txt
saclst stla stlo f *2007*/*HZ*SAC >> temp.txt
saclst stla stlo f *2008*/*HZ*SAC >> temp.txt
saclst stla stlo f *2009*/*HZ*SAC >> temp.txt
saclst stla stlo f *2010*/*HZ*SAC >> temp.txt
saclst stla stlo f *2011*/*HZ*SAC >> temp.txt
saclst stla stlo f *2012*/*HZ*SAC >> temp.txt
saclst stla stlo f *2013*/*HZ*SAC >> temp.txt
saclst stla stlo f *2014*/*HZ*SAC >> temp.txt
saclst stla stlo f *2015*/*HZ*SAC >> temp.txt
saclst stla stlo f *2016*/*HZ*SAC >> temp.txt
saclst stla stlo f *2017*/*HZ*SAC >> temp.txt
saclst stla stlo f *2018*/*HZ*SAC >> temp.txt
saclst stla stlo f *2019*/*HZ*SAC >> temp.txt


#saclst stla stlo f *20*/*HZ*SAC *1999*/*HZ*SAC> temp.txt
awk -F"." '{print $4,$5}' temp.txt > temp1.txt
awk '{print $2, $3}' temp.txt > temp2.txt
paste temp1.txt temp2.txt > temp3.txt
sort -u temp3.txt > STA_LON_LAT_SouthAfrica.dat
rm temp.txt temp*.txt

