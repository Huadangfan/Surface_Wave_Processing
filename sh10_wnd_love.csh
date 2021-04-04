#!/bin/csh
foreach event (`ls -d [0,1]*`)
echo $event
cd $event
cp ../wnd_love_30_40 .
cp ../wnd_love_40_50 .
cp ../wnd_love_50_60 .
cp ../wnd_love_60_120 .
#cp ../wnd_love_80_120 .
set file = `cat file_sta_input_love.d`
set gcarc = `saclst GCARC f $file | awk '{print int($2)}'`
echo $gcarc
#./wnd_love_80_120
if ($gcarc<40) then
./wnd_love_30_40
endif

if ($gcarc>60) then
./wnd_love_60_120
endif

if ($gcarc<50 && $gcarc>39) then
./wnd_love_40_50
endif

if ($gcarc<60 && $gcarc>49) then
./wnd_love_50_60
endif

cd ..


#if ($gcarc<50 && $gcarc=>40) then
#./wnd_love_40_50
#endif

#if ($gcarc<60 && $gcarc=>50) then
#./wnd_love_50_60
#endif

#if ($gcarc=>60) then
#./wnd_love_60_120
#endif

end
