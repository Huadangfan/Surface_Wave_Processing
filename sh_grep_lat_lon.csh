#!/bin/csh
rm EVLA_EVLO_love.dat EVLA_EVLO_rayleigh.dat event_list.dat
foreach file (`ls -d *200*`)
cd $file
pwd >> ../event_list.dat
saclst EVLA EVLO f *HZ*SAC*w | head -1 >> ../EVLA_EVLO_rayleigh.dat
saclst EVLA EVLO f *HT*SAC*w | head -1 >> ../EVLA_EVLO_love.dat

cd .. 
paste event_list.dat EVLA_EVLO.dat > EVLA_EVLO_all.dat 
end
