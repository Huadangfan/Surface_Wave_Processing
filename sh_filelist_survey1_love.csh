#!/bin/csh
rm temp.dat temp*.dat survey1_filelist_L_f*
set i=0
foreach event (`ls -d [0,1]*[0,1,2,3,4,5,6,7,8,9]`)
if (-e $event/survey1) then
cd $event/survey1
   set fileno = `ls D**HT*f006.w | wc -l`
      if ($fileno > 0) then
          @ i++
          echo $i
          ls D**HT*f006.w | wc -l > temp1.dat
          echo $i > temp2.dat
          paste temp1.dat temp2.dat >> ../../survey1_filelist_L_f006.dat
          ls $PWD/D**HT*f006.w >> ../../survey1_filelist_L_f006.dat
          cd ../..
          echo $i >> temp_i.dat
       else
cd ../..
       endif
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey1_filelist_L_f006.dat >> temp4.dat
mv temp4.dat survey1_filelist_L_f006.dat


rm temp.dat temp*.dat survey1_filelist_L_f survey1_filelist_L_f007.dat
set i=0
foreach event (`ls -d [0,1]*[0,1,2,3,4,5,6,7,8,9]`)
if (-e $event/survey1) then
cd $event/survey1
set fileno = `ls D**HT*f007.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HT*f007.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey1_filelist_L_f007.dat
ls $PWD/D**HT*f007.w >> ../../survey1_filelist_L_f007.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey1_filelist_L_f007.dat >> temp4.dat
mv temp4.dat survey1_filelist_L_f007.dat

rm temp.dat temp*.dat survey1_filelist_L_f survey1_filelist_L_f008.dat
set i=0
foreach event (`ls -d [0,1]*[0,1,2,3,4,5,6,7,8,9]`)
if (-e $event/survey1) then
cd $event/survey1
set fileno = `ls D**HT*f008.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HT*f008.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey1_filelist_L_f008.dat
ls $PWD/D**HT*f008.w >> ../../survey1_filelist_L_f008.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey1_filelist_L_f008.dat >> temp4.dat
mv temp4.dat survey1_filelist_L_f008.dat

rm temp.dat temp*.dat survey1_filelist_L_f survey1_filelist_L_f009.dat
set i=0
foreach event (`ls -d [0,1]*[0,1,2,3,4,5,6,7,8,9]`)
if (-e $event/survey1) then
cd $event/survey1
set fileno = `ls D**HT*f009.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HT*f009.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey1_filelist_L_f009.dat
ls $PWD/D**HT*f009.w >> ../../survey1_filelist_L_f009.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey1_filelist_L_f009.dat >> temp4.dat
mv temp4.dat survey1_filelist_L_f009.dat

rm temp.dat temp*.dat survey1_filelist_L_f survey1_filelist_L_f010.dat
set i=0
foreach event (`ls -d [0,1]*[0,1,2,3,4,5,6,7,8,9]`)
if (-e $event/survey1) then
cd $event/survey1
set fileno = `ls D**HT*f010.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HT*f010.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey1_filelist_L_f010.dat
ls $PWD/D**HT*f010.w >> ../../survey1_filelist_L_f010.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey1_filelist_L_f010.dat >> temp4.dat
mv temp4.dat survey1_filelist_L_f010.dat

rm temp.dat temp*.dat survey1_filelist_L_f survey1_filelist_L_f012.dat
set i=0
foreach event (`ls -d [0,1]*[0,1,2,3,4,5,6,7,8,9]`)
if (-e $event/survey1) then
cd $event/survey1
set fileno = `ls D**HT*f012.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HT*f012.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey1_filelist_L_f012.dat
ls $PWD/D**HT*f012.w >> ../../survey1_filelist_L_f012.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey1_filelist_L_f012.dat >> temp4.dat
mv temp4.dat survey1_filelist_L_f012.dat

rm temp.dat temp*.dat survey1_filelist_L_f survey1_filelist_L_f013.dat
set i=0
foreach event (`ls -d [0,1]*[0,1,2,3,4,5,6,7,8,9]`)
if (-e $event/survey1) then
cd $event/survey1
set fileno = `ls D**HT*f013.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HT*f013.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey1_filelist_L_f013.dat
ls $PWD/D**HT*f013.w >> ../../survey1_filelist_L_f013.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey1_filelist_L_f013.dat >> temp4.dat
mv temp4.dat survey1_filelist_L_f013.dat

rm temp.dat temp*.dat survey1_filelist_L_f survey1_filelist_L_f015.dat
set i=0
foreach event (`ls -d [0,1]*[0,1,2,3,4,5,6,7,8,9]`)
if (-e $event/survey1) then
cd $event/survey1
set fileno = `ls D**HT*f015.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HT*f015.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey1_filelist_L_f015.dat
ls $PWD/D**HT*f015.w >> ../../survey1_filelist_L_f015.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey1_filelist_L_f015.dat >> temp4.dat
mv temp4.dat survey1_filelist_L_f015.dat

rm temp.dat temp*.dat survey1_filelist_L_f survey1_filelist_L_f017.dat
set i=0
foreach event (`ls -d [0,1]*[0,1,2,3,4,5,6,7,8,9]`)
if (-e $event/survey1) then
cd $event/survey1
set fileno = `ls D**HT*f017.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HT*f017.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey1_filelist_L_f017.dat
ls $PWD/D**HT*f017.w >> ../../survey1_filelist_L_f017.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey1_filelist_L_f017.dat >> temp4.dat
mv temp4.dat survey1_filelist_L_f017.dat

rm temp.dat temp*.dat survey1_filelist_L_f survey1_filelist_L_f020.dat
set i=0
foreach event (`ls -d [0,1]*[0,1,2,3,4,5,6,7,8,9]`)
if (-e $event/survey1) then
cd $event/survey1
set fileno = `ls D**HT*f020.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HT*f020.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey1_filelist_L_f020.dat
ls $PWD/D**HT*f020.w >> ../../survey1_filelist_L_f020.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey1_filelist_L_f020.dat >> temp4.dat
mv temp4.dat survey1_filelist_L_f020.dat

rm temp.dat temp*.dat survey1_filelist_L_f survey1_filelist_L_f022.dat
set i=0
foreach event (`ls -d [0,1]*[0,1,2,3,4,5,6,7,8,9]`)
if (-e $event/survey1) then
cd $event/survey1
set fileno = `ls D**HT*f022.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HT*f022.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey1_filelist_L_f022.dat
ls $PWD/D**HT*f022.w >> ../../survey1_filelist_L_f022.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey1_filelist_L_f022.dat >> temp4.dat
mv temp4.dat survey1_filelist_L_f022.dat


rm temp.dat temp*.dat survey1_filelist_L_f survey1_filelist_L_f025.dat
set i=0
foreach event (`ls -d [0,1]*[0,1,2,3,4,5,6,7,8,9]`)
if (-e $event/survey1) then
cd $event/survey1
set fileno = `ls D**HT*f025.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HT*f025.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey1_filelist_L_f025.dat
ls $PWD/D**HT*f025.w >> ../../survey1_filelist_L_f025.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey1_filelist_L_f025.dat >> temp4.dat
mv temp4.dat survey1_filelist_L_f025.dat

rm temp.dat temp*.dat survey1_filelist_L_f survey1_filelist_L_f029.dat
set i=0
foreach event (`ls -d [0,1]*[0,1,2,3,4,5,6,7,8,9]`)
if (-e $event/survey1) then
cd $event/survey1
set fileno = `ls D**HT*f029.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HT*f029.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey1_filelist_L_f029.dat
ls $PWD/D**HT*f029.w >> ../../survey1_filelist_L_f029.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey1_filelist_L_f029.dat >> temp4.dat
mv temp4.dat survey1_filelist_L_f029.dat

rm temp.dat temp*.dat survey1_filelist_L_f survey1_filelist_L_f033.dat
set i=0
foreach event (`ls -d [0,1]*[0,1,2,3,4,5,6,7,8,9]`)
if (-e $event/survey1) then
cd $event/survey1
set fileno = `ls D**HT*f033.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HT*f033.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey1_filelist_L_f033.dat
ls $PWD/D**HT*f033.w >> ../../survey1_filelist_L_f033.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey1_filelist_L_f033.dat >> temp4.dat
mv temp4.dat survey1_filelist_L_f033.dat

rm temp.dat temp*.dat survey1_filelist_L_f survey1_filelist_L_f037.dat
set i=0
foreach event (`ls -d [0,1]*[0,1,2,3,4,5,6,7,8,9]`)
if (-e $event/survey1) then
cd $event/survey1
set fileno = `ls D**HT*f037.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HT*f037.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey1_filelist_L_f037.dat
ls $PWD/D**HT*f037.w >> ../../survey1_filelist_L_f037.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey1_filelist_L_f037.dat >> temp4.dat
mv temp4.dat survey1_filelist_L_f037.dat

rm temp.dat temp*.dat survey1_filelist_L_f survey1_filelist_L_f040.dat
set i=0
foreach event (`ls -d [0,1]*[0,1,2,3,4,5,6,7,8,9]`)
if (-e $event/survey1) then
cd $event/survey1
set fileno = `ls D**HT*f040.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HT*f040.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey1_filelist_L_f040.dat
ls $PWD/D**HT*f040.w >> ../../survey1_filelist_L_f040.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey1_filelist_L_f040.dat >> temp4.dat
mv temp4.dat survey1_filelist_L_f040.dat

rm temp.dat temp*.dat survey1_filelist_L_f survey1_filelist_L_f045.dat
set i=0
foreach event (`ls -d [0,1]*[0,1,2,3,4,5,6,7,8,9]`)
if (-e $event/survey1) then
cd $event/survey1
set fileno = `ls D**HT*f045.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HT*f045.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey1_filelist_L_f045.dat
ls $PWD/D**HT*f045.w >> ../../survey1_filelist_L_f045.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey1_filelist_L_f045.dat >> temp4.dat
mv temp4.dat survey1_filelist_L_f045.dat

rm temp.dat temp*.dat survey1_filelist_L_f survey1_filelist_L_f050.dat
set i=0
foreach event (`ls -d [0,1]*[0,1,2,3,4,5,6,7,8,9]`)
if (-e $event/survey1) then
cd $event/survey1
set fileno = `ls D**HT*f050.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HT*f050.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey1_filelist_L_f050.dat
ls $PWD/D**HT*f050.w >> ../../survey1_filelist_L_f050.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey1_filelist_L_f050.dat >> temp4.dat
mv temp4.dat survey1_filelist_L_f050.dat


