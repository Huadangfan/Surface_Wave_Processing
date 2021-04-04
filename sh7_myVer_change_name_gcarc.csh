#!/bin/csh

################################
#### NOTE:HAVE THE ARGEMENT ####
################################
#--------------------------------------------------------------#
# Ami to change the file name by the GCARC
#--------------------------------------------------------------#
# the num scale(the num of the events) is the first argument   #
#--------------------------------------------------------------#
# After change the name, run the temp.csh to change            #
#--------------------------------------------------------------#

rm temp.csh temp1.dat temp1_event.dat
foreach event (`ls -d [1,2]*[0,1,2,3,4,5,6,7,8,9]`)
cd $event
echo $event >> ../temp1_event.dat
echo $event
saclst GCARC f *SAC | tail -1 | awk '{print $2}' >> ../temp1.dat 
cd ..
end

paste temp1_event.dat temp1.dat > temp1_1.dat

#---- the cut the events name ----
cat temp1_1.dat | awk '{print $1,$2}' > temp1_1_1.dat
mv temp1_1_1.dat temp1_1.dat
cat temp1_1.dat | sort -n -k 2,2 | awk '{print $1}' > temp1.dat


#saclst GCARC f */D*HZ.M.SAC | sort -n -k 2,2 | cut -c1-9 > temp1.dat
awk '{print "mv", $1}' temp1.dat > temp2.dat
#--------------------------------------------------------------------------
if ( $1 < 999 ) then
if ( $1 > 99 ) then 
set e=0
@ e = $1 - 99
# if the events are 100+, using this code
cat -n temp1.dat | awk '{print "00"$1$2}' | head -9 > temp3.dat
cat -n temp1.dat | awk '{print "0"$1$2}' | head -99 | tail -90 >> temp3.dat
cat -n temp1.dat | awk '{print $1$2}' | head -$1 | tail -$e >> temp3.dat
endif
endif
#--------------------------------------------------------------------------
# if the events are 1000+, using this code
if ( $1 < 9999 ) then
if ( $1 > 999 ) then 
set e=0
@ e = $1 - 999
# if the events are 100+, using this code
cat -n temp1.dat | awk '{print "000"$1$2}' | head -9 > temp3.dat
cat -n temp1.dat | awk '{print "00"$1$2}' | head -99 | tail -90 >> temp3.dat
cat -n temp1.dat | awk '{print "0"$1$2}' | head -999 | tail -900 >> temp3.dat
cat -n temp1.dat | awk '{print $1$2}' | head -$1 | tail -$e >> temp3.dat
endif
endif

#cat -n temp1.dat | awk '{print $1$2}' | tail -98 >> temp3.dat
#awk '{print "`#!/bin/csh`", $1}' temp3.dat | awk '{print $1}' > temp.csh
paste temp2.dat temp3.dat > temp.csh
chmod 777 temp.csh
#./temp.csh

#rm temp1.dat temp2.dat temp3.dat 
