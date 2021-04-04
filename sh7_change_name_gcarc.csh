#!/bin/csh
#rm temp.csh temp1.dat temp1_event.dat
foreach event (`ls -d $1`)
cd $event
echo $event >> ../temp1_event.dat
saclst GCARC f *SAC | head -1 | awk '{print $2}' >> ../temp1.dat 
cd ..
end

paste temp1_event.dat temp1.dat > temp1_1.dat

cat temp1_1.dat | sort -n -k 2,2 | cut -c1-9 > temp1.dat


#saclst GCARC f */D*HZ.M.SAC | sort -n -k 2,2 | cut -c1-9 > temp1.dat
awk '{print "mv", $1}' temp1.dat > temp2.dat
cat -n temp1.dat | awk '{print "000"$1$2}' | head -9 > temp3.dat
cat -n temp1.dat | awk '{print "00"$1$2}' | head -99 | tail -90 >> temp3.dat
cat -n temp1.dat | awk '{print "0"$1$2}' | head -999 | tail -900 >> temp3.dat
set number=`ls -d 1* 2* | wc -l`
set number1=`echo ''$number'-99' | bc`
set number2=`echo ''$number'-999' | bc`
cat -n temp1.dat | awk '{print $1$2}' | tail -$number2 >> temp3.dat
#awk '{print "`#!/bin/csh`", $1}' temp3.dat | awk '{print $1}' > temp.csh
paste temp2.dat temp3.dat > temp.csh
chmod 777 temp.csh
#./temp.csh

#rm temp1.dat temp2.dat temp3.dat 
