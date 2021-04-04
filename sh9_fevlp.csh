#!/bin/csh
foreach event (`ls -d $1`)
echo $event
cd $event
cp ../fevlp.m .
set file = `cat file_sta_input.d`
echo $file
sac << EOF
m fevlp.m $file
quit
EOF
cd ..
end
