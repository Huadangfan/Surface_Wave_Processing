#!/bin/csh
rm temp.dat temp*.dat survey2_filelist_R_f*
set i=0
foreach event (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
cd $event/survey2
   set fileno = `ls D**HZ*f006.w | wc -l`
      if ($fileno > 0) then
          @ i++
          echo $i
          ls D**HZ*f006.w | wc -l > temp1.dat
          echo $i > temp2.dat
          paste temp1.dat temp2.dat >> ../../survey2_filelist_R_f006.dat
          ls $PWD/D**HZ*f006.w >> ../../survey2_filelist_R_f006.dat
          cd ../..
          echo $i >> temp_i.dat
       else
cd ../..
       endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey2_filelist_R_f006.dat >> temp4.dat
mv temp4.dat survey2_filelist_R_f006.dat


rm temp.dat temp*.dat survey2_filelist_R_f survey2_filelist_R_f007.dat
set i=0
foreach event (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
if (-e $event/survey2) then
cd $event/survey2
set fileno = `ls D**HZ*f007.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HZ*f007.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey2_filelist_R_f007.dat
ls $PWD/D**HZ*f007.w >> ../../survey2_filelist_R_f007.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey2_filelist_R_f007.dat >> temp4.dat
mv temp4.dat survey2_filelist_R_f007.dat

rm temp.dat temp*.dat survey2_filelist_R_f survey2_filelist_R_f008.dat
set i=0
foreach event (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
cd $event/survey2
set fileno = `ls D**HZ*f008.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HZ*f008.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey2_filelist_R_f008.dat
ls $PWD/D**HZ*f008.w >> ../../survey2_filelist_R_f008.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey2_filelist_R_f008.dat >> temp4.dat
mv temp4.dat survey2_filelist_R_f008.dat

rm temp.dat temp*.dat survey2_filelist_R_f survey2_filelist_R_f009.dat
set i=0
foreach event (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
cd $event/survey2
set fileno = `ls D**HZ*f009.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HZ*f009.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey2_filelist_R_f009.dat
ls $PWD/D**HZ*f009.w >> ../../survey2_filelist_R_f009.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey2_filelist_R_f009.dat >> temp4.dat
mv temp4.dat survey2_filelist_R_f009.dat

rm temp.dat temp*.dat survey2_filelist_R_f survey2_filelist_R_f010.dat
set i=0
foreach event (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
cd $event/survey2
set fileno = `ls D**HZ*f010.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HZ*f010.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey2_filelist_R_f010.dat
ls $PWD/D**HZ*f010.w >> ../../survey2_filelist_R_f010.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey2_filelist_R_f010.dat >> temp4.dat
mv temp4.dat survey2_filelist_R_f010.dat

rm temp.dat temp*.dat survey2_filelist_R_f survey2_filelist_R_f012.dat
set i=0
foreach event (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
cd $event/survey2
set fileno = `ls D**HZ*f012.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HZ*f012.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey2_filelist_R_f012.dat
ls $PWD/D**HZ*f012.w >> ../../survey2_filelist_R_f012.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey2_filelist_R_f012.dat >> temp4.dat
mv temp4.dat survey2_filelist_R_f012.dat

rm temp.dat temp*.dat survey2_filelist_R_f survey2_filelist_R_f013.dat
set i=0
foreach event (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
cd $event/survey2
set fileno = `ls D**HZ*f013.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HZ*f013.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey2_filelist_R_f013.dat
ls $PWD/D**HZ*f013.w >> ../../survey2_filelist_R_f013.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey2_filelist_R_f013.dat >> temp4.dat
mv temp4.dat survey2_filelist_R_f013.dat

rm temp.dat temp*.dat survey2_filelist_R_f survey2_filelist_R_f015.dat
set i=0
foreach event (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
cd $event/survey2
set fileno = `ls D**HZ*f015.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HZ*f015.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey2_filelist_R_f015.dat
ls $PWD/D**HZ*f015.w >> ../../survey2_filelist_R_f015.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey2_filelist_R_f015.dat >> temp4.dat
mv temp4.dat survey2_filelist_R_f015.dat

rm temp.dat temp*.dat survey2_filelist_R_f survey2_filelist_R_f017.dat
set i=0
foreach event (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
cd $event/survey2
set fileno = `ls D**HZ*f017.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HZ*f017.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey2_filelist_R_f017.dat
ls $PWD/D**HZ*f017.w >> ../../survey2_filelist_R_f017.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey2_filelist_R_f017.dat >> temp4.dat
mv temp4.dat survey2_filelist_R_f017.dat

rm temp.dat temp*.dat survey2_filelist_R_f survey2_filelist_R_f020.dat
set i=0
foreach event (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
cd $event/survey2
set fileno = `ls D**HZ*f020.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HZ*f020.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey2_filelist_R_f020.dat
ls $PWD/D**HZ*f020.w >> ../../survey2_filelist_R_f020.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey2_filelist_R_f020.dat >> temp4.dat
mv temp4.dat survey2_filelist_R_f020.dat

rm temp.dat temp*.dat survey2_filelist_R_f survey2_filelist_R_f022.dat
set i=0
foreach event (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
cd $event/survey2
set fileno = `ls D**HZ*f022.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HZ*f022.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey2_filelist_R_f022.dat
ls $PWD/D**HZ*f022.w >> ../../survey2_filelist_R_f022.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey2_filelist_R_f022.dat >> temp4.dat
mv temp4.dat survey2_filelist_R_f022.dat


rm temp.dat temp*.dat survey2_filelist_R_f survey2_filelist_R_f025.dat
set i=0
foreach event (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
cd $event/survey2
set fileno = `ls D**HZ*f025.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HZ*f025.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey2_filelist_R_f025.dat
ls $PWD/D**HZ*f025.w >> ../../survey2_filelist_R_f025.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey2_filelist_R_f025.dat >> temp4.dat
mv temp4.dat survey2_filelist_R_f025.dat

rm temp.dat temp*.dat survey2_filelist_R_f survey2_filelist_R_f029.dat
set i=0
foreach event (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
cd $event/survey2
set fileno = `ls D**HZ*f029.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HZ*f029.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey2_filelist_R_f029.dat
ls $PWD/D**HZ*f029.w >> ../../survey2_filelist_R_f029.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey2_filelist_R_f029.dat >> temp4.dat
mv temp4.dat survey2_filelist_R_f029.dat

rm temp.dat temp*.dat survey2_filelist_R_f survey2_filelist_R_f033.dat
set i=0
foreach event (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
cd $event/survey2
set fileno = `ls D**HZ*f033.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HZ*f033.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey2_filelist_R_f033.dat
ls $PWD/D**HZ*f033.w >> ../../survey2_filelist_R_f033.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey2_filelist_R_f033.dat >> temp4.dat
mv temp4.dat survey2_filelist_R_f033.dat

rm temp.dat temp*.dat survey2_filelist_R_f survey2_filelist_R_f037.dat
set i=0
foreach event (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
cd $event/survey2
set fileno = `ls D**HZ*f037.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HZ*f037.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey2_filelist_R_f037.dat
ls $PWD/D**HZ*f037.w >> ../../survey2_filelist_R_f037.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey2_filelist_R_f037.dat >> temp4.dat
mv temp4.dat survey2_filelist_R_f037.dat

rm temp.dat temp*.dat survey2_filelist_R_f survey2_filelist_R_f040.dat
set i=0
foreach event (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
cd $event/survey2
set fileno = `ls D**HZ*f040.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HZ*f040.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey2_filelist_R_f040.dat
ls $PWD/D**HZ*f040.w >> ../../survey2_filelist_R_f040.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey2_filelist_R_f040.dat >> temp4.dat
mv temp4.dat survey2_filelist_R_f040.dat

rm temp.dat temp*.dat survey2_filelist_R_f survey2_filelist_R_f045.dat
set i=0
foreach event (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
cd $event/survey2
set fileno = `ls D**HZ*f045.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HZ*f045.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey2_filelist_R_f045.dat
ls $PWD/D**HZ*f045.w >> ../../survey2_filelist_R_f045.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey2_filelist_R_f045.dat >> temp4.dat
mv temp4.dat survey2_filelist_R_f045.dat

rm temp.dat temp*.dat survey2_filelist_R_f survey2_filelist_R_f050.dat
set i=0
foreach event (`ls -d *1997* *1998* *1999* *2000* 2001* *2002* *2007* *2008* *2009* *2010* *2011* *2012* *2012* *2013* *2014* *2015* *2016* *2017* *2018* *2019*`)
cd $event/survey2
set fileno = `ls D**HZ*f050.w | wc -l`
if ($fileno > 0) then
@ i++
echo $i
ls D**HZ*f050.w | wc -l > temp1.dat
echo $i > temp2.dat
paste temp1.dat temp2.dat >> ../../survey2_filelist_R_f050.dat
ls $PWD/D**HZ*f050.w >> ../../survey2_filelist_R_f050.dat
cd ../..
echo $i >> temp_i.dat  
else
cd ../..
endif
end
cat -n temp_i.dat | awk '{print $1}' | tail -1 > temp4.dat
more survey2_filelist_R_f050.dat >> temp4.dat
mv temp4.dat survey2_filelist_R_f050.dat


