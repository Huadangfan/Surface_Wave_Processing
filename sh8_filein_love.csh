#!/bin/csh
foreach event (`ls -d [0,1]*`)
echo $event
cd $event
ls  *.*HT.*SAC | wc -l > file_love.in
ls *.*HT.*SAC >> file_love.in
cp ../freq.in .
cp ../fevlp_love.m .
ls D**HT*SAC | tail -1 > file_sta_input_love.d
cd ..
end
