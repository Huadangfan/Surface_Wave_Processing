#!/bin/csh
foreach file (`ls -d $1`)
cd $file
sac <<EOF

r D*SAC
ch khole
w over
quit
EOF

cd ..
end
