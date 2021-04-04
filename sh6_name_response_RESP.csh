#!/bin/csh

export SAC_DISPLAY_COPYRIGHT=0

foreach file (`ls -d $1`)
cp ./RESP_TEST/RESP* $file
cd $file
mkdir bad_data
foreach STA (`cat stadis | awk '{print $1}'`)

set stano=`ls *.$STA.*.M.SAC | wc -l`
if ($stano < 3) then
mv *.$STA.*.M.SAC bad_data
else
echo $STA
endif
end




foreach STA (`cat stadis | awk '{print $1}'`)

set DISN = `cat stadis | grep $STA | awk '{ print $4 }' | head -1`
set STANET = `cat stadis | grep $STA | awk '{ print $2}' | head -1`
if ((-e D$DISN.$STANET.$STA.BHZ.M.SAC) || (-e D$DISN.$STANET.$STA.HHZ.M.SAC)) then
sac << EOF
r D$DISN.$STANET.$STA.*HZ.M.SAC
rmean
rtrend
taper
w over
r D$DISN.$STANET.$STA.*HZ.M.SAC
TRANS FROM EVALRESP TO EVALRESP STATION SA10 CHANNEL BHZ NETWORK XA
w over
quit
EOF
else 
echo $STANET
endif

if (((-e D$DISN.$STANET.$STA.BHE.M.SAC) || (-e D$DISN.$STANET.$STA.HHE.M.SAC)) && ((-e D$DISN.$STANET.$STA.BHN.M.SAC) || (-e D$DISN.$STANET.$STA.HHN.M.SAC))) then
sac << EOF
r D$DISN.$STANET.$STA.*HE.M.SAC D$DISN.$STANET.$STA.*HN.M.SAC
rmean
rtrend
taper
w over

r D$DISN.$STANET.$STA.*HE.M.SAC
TRANS FROM EVALRESP TO EVALRESP STATION SA10 CHANNEL BHE NETWORK XA
w over

r D$DISN.$STANET.$STA.*HN.M.SAC
TRANS FROM EVALRESP TO EVALRESP STATION SA10 CHANNEL BHN NETWORK XA
w over

r D$DISN.$STANET.$STA.*HE.M.SAC D$DISN.$STANET.$STA.*HN.M.SAC
setbb bg (max &1,B &2,B )
setbb ed (min &1,E &2,E )
cut %bg %ed
r
w over
cut off

r D$DISN.$STANET.$STA.*HE.M.SAC
ch CMPAZ 90 CMPINC 90
wh
r D$DISN.$STANET.$STA.*HN.M.SAC
ch CMPAZ 0 CMPINC 90
wh

r D$DISN.$STANET.$STA.*HE.M.SAC D$DISN.$STANET.$STA.*HN.M.SAC
rotate to GCP
w D$DISN.$STANET.$STA.BHR.M.SAC D$DISN.$STANET.$STA.BHT.M.SAC
quit
EOF
else 
echo $STANET

endif
end

rm RESP.*
cd ..
end
