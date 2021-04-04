#!/bin/csh
rm temp.dat temp*.dat filelist_L_f*
set i=0
foreach event (`ls -d *200*`)
cd $event
set fileno = `ls D*BHT*f006.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D*BHT*f006.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../filelist_L_f006.dat
ls $PWD/D*BHT*f006.w >> ../filelist_L_f006.dat
cd ..
echo $i >> temp_i.dat
else
cd ..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more filelist_L_f006.dat >> temp4.dat
mv temp4.dat filelist_L_f006.dat


rm temp.dat temp*.dat filelist_L_f filelist_L_f007.dat
set i=0
foreach event (`ls -d *200*`)
cd $event
set fileno = `ls D*BHT*f007.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D*BHT*f007.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../filelist_L_f007.dat
ls $PWD/D*BHT*f007.w >> ../filelist_L_f007.dat
cd ..
echo $i >> temp_i.dat  
else
cd ..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more filelist_L_f007.dat >> temp4.dat
mv temp4.dat filelist_L_f007.dat

rm temp.dat temp*.dat filelist_L_f filelist_L_f008.dat
set i=0
foreach event (`ls -d *200*`)
cd $event
set fileno = `ls D*BHT*f008.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D*BHT*f008.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../filelist_L_f008.dat
ls $PWD/D*BHT*f008.w >> ../filelist_L_f008.dat
cd ..
echo $i >> temp_i.dat  
else
cd ..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more filelist_L_f008.dat >> temp4.dat
mv temp4.dat filelist_L_f008.dat

rm temp.dat temp*.dat filelist_L_f filelist_L_f009.dat
set i=0
foreach event (`ls -d *200*`)
cd $event
set fileno = `ls D*BHT*f009.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D*BHT*f009.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../filelist_L_f009.dat
ls $PWD/D*BHT*f009.w >> ../filelist_L_f009.dat
cd ..
echo $i >> temp_i.dat  
else
cd ..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more filelist_L_f009.dat >> temp4.dat
mv temp4.dat filelist_L_f009.dat

rm temp.dat temp*.dat filelist_L_f filelist_L_f010.dat
set i=0
foreach event (`ls -d *200*`)
cd $event
set fileno = `ls D*BHT*f010.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D*BHT*f010.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../filelist_L_f010.dat
ls $PWD/D*BHT*f010.w >> ../filelist_L_f010.dat
cd ..
echo $i >> temp_i.dat  
else
cd ..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more filelist_L_f010.dat >> temp4.dat
mv temp4.dat filelist_L_f010.dat

rm temp.dat temp*.dat filelist_L_f filelist_L_f012.dat
set i=0
foreach event (`ls -d *200*`)
cd $event
set fileno = `ls D*BHT*f012.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D*BHT*f012.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../filelist_L_f012.dat
ls $PWD/D*BHT*f012.w >> ../filelist_L_f012.dat
cd ..
echo $i >> temp_i.dat  
else
cd ..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more filelist_L_f012.dat >> temp4.dat
mv temp4.dat filelist_L_f012.dat

rm temp.dat temp*.dat filelist_L_f filelist_L_f013.dat
set i=0
foreach event (`ls -d *200*`)
cd $event
set fileno = `ls D*BHT*f013.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D*BHT*f013.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../filelist_L_f013.dat
ls $PWD/D*BHT*f013.w >> ../filelist_L_f013.dat
cd ..
echo $i >> temp_i.dat  
else
cd ..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more filelist_L_f013.dat >> temp4.dat
mv temp4.dat filelist_L_f013.dat

rm temp.dat temp*.dat filelist_L_f filelist_L_f015.dat
set i=0
foreach event (`ls -d *200*`)
cd $event
set fileno = `ls D*BHT*f015.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D*BHT*f015.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../filelist_L_f015.dat
ls $PWD/D*BHT*f015.w >> ../filelist_L_f015.dat
cd ..
echo $i >> temp_i.dat  
else
cd ..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more filelist_L_f015.dat >> temp4.dat
mv temp4.dat filelist_L_f015.dat

rm temp.dat temp*.dat filelist_L_f filelist_L_f017.dat
set i=0
foreach event (`ls -d *200*`)
cd $event
set fileno = `ls D*BHT*f017.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D*BHT*f017.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../filelist_L_f017.dat
ls $PWD/D*BHT*f017.w >> ../filelist_L_f017.dat
cd ..
echo $i >> temp_i.dat  
else
cd ..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more filelist_L_f017.dat >> temp4.dat
mv temp4.dat filelist_L_f017.dat

rm temp.dat temp*.dat filelist_L_f filelist_L_f020.dat
set i=0
foreach event (`ls -d *200*`)
cd $event
set fileno = `ls D*BHT*f020.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D*BHT*f020.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../filelist_L_f020.dat
ls $PWD/D*BHT*f020.w >> ../filelist_L_f020.dat
cd ..
echo $i >> temp_i.dat  
else
cd ..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more filelist_L_f020.dat >> temp4.dat
mv temp4.dat filelist_L_f020.dat

rm temp.dat temp*.dat filelist_L_f filelist_L_f022.dat
set i=0
foreach event (`ls -d *200*`)
cd $event
set fileno = `ls D*BHT*f022.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D*BHT*f022.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../filelist_L_f022.dat
ls $PWD/D*BHT*f022.w >> ../filelist_L_f022.dat
cd ..
echo $i >> temp_i.dat  
else
cd ..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more filelist_L_f022.dat >> temp4.dat
mv temp4.dat filelist_L_f022.dat

rm temp.dat temp*.dat filelist_L_f filelist_L_f025.dat
set i=0
foreach event (`ls -d *200*`)
cd $event
set fileno = `ls D*BHT*f025.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D*BHT*f025.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../filelist_L_f025.dat
ls $PWD/D*BHT*f025.w >> ../filelist_L_f025.dat
cd ..
echo $i >> temp_i.dat  
else
cd ..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more filelist_L_f025.dat >> temp4.dat
mv temp4.dat filelist_L_f025.dat

rm temp.dat temp*.dat filelist_L_f filelist_L_f029.dat
set i=0
foreach event (`ls -d *200*`)
cd $event
set fileno = `ls D*BHT*f029.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D*BHT*f029.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../filelist_L_f029.dat
ls $PWD/D*BHT*f029.w >> ../filelist_L_f029.dat
cd ..
echo $i >> temp_i.dat  
else
cd ..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more filelist_L_f029.dat >> temp4.dat
mv temp4.dat filelist_L_f029.dat

rm temp.dat temp*.dat filelist_L_f filelist_L_f033.dat
set i=0
foreach event (`ls -d *200*`)
cd $event
set fileno = `ls D*BHT*f033.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D*BHT*f033.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../filelist_L_f033.dat
ls $PWD/D*BHT*f033.w >> ../filelist_L_f033.dat
cd ..
echo $i >> temp_i.dat  
else
cd ..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more filelist_L_f033.dat >> temp4.dat
mv temp4.dat filelist_L_f033.dat

rm temp.dat temp*.dat filelist_L_f filelist_L_f037.dat
set i=0
foreach event (`ls -d *200*`)
cd $event
set fileno = `ls D*BHT*f037.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D*BHT*f037.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../filelist_L_f037.dat
ls $PWD/D*BHT*f037.w >> ../filelist_L_f037.dat
cd ..
echo $i >> temp_i.dat  
else
cd ..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more filelist_L_f037.dat >> temp4.dat
mv temp4.dat filelist_L_f037.dat

rm temp.dat temp*.dat filelist_L_f filelist_L_f040.dat
set i=0
foreach event (`ls -d *200*`)
cd $event
set fileno = `ls D*BHT*f040.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D*BHT*f040.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../filelist_L_f040.dat
ls $PWD/D*BHT*f040.w >> ../filelist_L_f040.dat
cd ..
echo $i >> temp_i.dat  
else
cd ..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more filelist_L_f040.dat >> temp4.dat
mv temp4.dat filelist_L_f040.dat

rm temp.dat temp*.dat filelist_L_f filelist_L_f045.dat
set i=0
foreach event (`ls -d *200*`)
cd $event
set fileno = `ls D*BHT*f045.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D*BHT*f045.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../filelist_L_f045.dat
ls $PWD/D*BHT*f045.w >> ../filelist_L_f045.dat
cd ..
echo $i >> temp_i.dat  
else
cd ..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more filelist_L_f045.dat >> temp4.dat
mv temp4.dat filelist_L_f045.dat

rm temp.dat temp*.dat filelist_L_f filelist_L_f050.dat
set i=0
foreach event (`ls -d *200*`)
cd $event
set fileno = `ls D*BHT*f050.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D*BHT*f050.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../filelist_L_f050.dat
ls $PWD/D*BHT*f050.w >> ../filelist_L_f050.dat
cd ..
echo $i >> temp_i.dat  
else
cd ..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more filelist_L_f050.dat >> temp4.dat
mv temp4.dat filelist_L_f050.dat


