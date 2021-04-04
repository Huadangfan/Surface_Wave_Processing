#!/bin/bash

rm temp3.txt tmp_station_info.txt

for file in `ls -d 1* 2*`;do
    echo $file
    cd $file
    saclst knetwk kstnm stla stlo f *SAC | awk '{print $2,$3,$4,$5}' >> ../temp3.txt
    cd ..
done

sort -u temp3.txt > tmp_station_info.txt
