#!/bin/csh
foreach event (`ls -d $1`)
echo $event
cd $event
cp ../fevlp_love.m .
set file = `cat file_sta_input_love.d`
echo $file
sac << EOF
m fevlp_love.m $file
quit
EOF
cd ..
end
