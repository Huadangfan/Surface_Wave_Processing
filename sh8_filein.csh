#!/bin/csh
foreach event (`ls -d $1`)
echo $event
cd $event
ls  *.*HZ.*SAC | wc -l > file_rayleigh.in
ls *.*HZ.*SAC >> file_rayleigh.in
cp ../freq.in .
#cp ../wnd_rayleigh .
cp ../fevlp.m .
ls D**HZ*SAC | tail -1 > file_sta_input.d
cd ..
end
