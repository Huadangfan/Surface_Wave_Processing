#!/bin/csh
foreach file (`ls *seed`)
echo $file
rdseed -d -f -R $file
end
