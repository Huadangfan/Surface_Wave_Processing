*sac macro file for automatically windowing and filtering all the stations
*in a directory for a particular event.  Window parameters should be based
*on previous examination of filtered records at a near and far station of the
*array - then linearly interpolate windows based on distance
*
*To avoid useless files, should previously have labelled files that aren't
*to be used with prefix b for bad, as in b.D30.N07.HOT07.Z
*
* 

echo on c m p
setbb ffile $1
rh %ffile
setbb dist &1,DIST
setbb phv20 3.0
evaluate to cute %dist / %phv20 + 1800
if %cute GT 3000
 evaluate to cutb %cute - 3000
else
 evaluate to cutb 100 
endif

*do file list D05.N85.SUR.T
do file wild D*HZ*SAC


 setbb fn1 $file
 setbb fn2 %fn1%.w
 r %fn1
 setbb endtime &1,E
 setbb npts &1,NPTS
if %cutb LT %endtime
 cut %cutb %cute
 r %fn1
 w %fn2
 cut off
 xlim off
 rmean
 taper
 
 do BANDP from 1 to 18 by 1
  r %fn2
*  p1
                  	
  if $BANDP EQ 1 
    setbb SUFIX 'f050'
    bp co .045 .055 n 4 p 2
    w %fn1%.%SUFIX%
    envelope
*    p1
    w %fn1%.%SUFIX%.evlp
    
  elseif $BANDP EQ 2 
    setbb SUFIX 'f045'
    bp co .04 .05 n 4 p 2
    w %fn1%.%SUFIX%
    envelope
    
    w %fn1%.%SUFIX%.evlp

   elseif $BANDP EQ 3
    bp co .035 .045 n 4 p 2
    setbb SUFIX 'f040' 
    w %fn1%.%SUFIX%
    envelope
    w %fn1%.%SUFIX%.evlp
     
  elseif $BANDP EQ 4
    bp co .032 .042 n 4 p 2 
    setbb SUFIX 'f037' 
    w %fn1%.%SUFIX%
    envelope
    w %fn1%.%SUFIX%.evlp  
    
 
 elseif $BANDP EQ 5
    bp co .028 .038 n 4 p 2 
    setbb SUFIX 'f033' 
    w %fn1%.%SUFIX%
    envelope
    w %fn1%.%SUFIX%.evlp  

  elseif $BANDP EQ 6
    bp co .024 .034 n 4 p 2 
    setbb SUFIX 'f029'
    w %fn1%.%SUFIX%
    envelope
    w %fn1%.%SUFIX%.evlp  
     
 elseif $BANDP EQ 7
    bp co .02 .03 n 4 p 2 
    setbb SUFIX 'f025'
    w %fn1%.%SUFIX%
    envelope
    w %fn1%.%SUFIX%.evlp  

 elseif $BANDP EQ 8
    bp co .017 .027 n 4 p 2 
    setbb SUFIX 'f022'
    w %fn1%.%SUFIX%
    envelope
    w %fn1%.%SUFIX%.evlp  

 elseif $BANDP EQ 9
    bp co .015 .025 n 4 p 2 
    setbb SUFIX 'f020'
    w %fn1%.%SUFIX%
    envelope
    w %fn1%.%SUFIX%.evlp   

  elseif $BANDP EQ 10
    bp co .012 .022 n 4 p 2 
    setbb SUFIX 'f017'
    w %fn1%.%SUFIX%
    envelope
    w %fn1%.%SUFIX%.evlp   

  elseif $BANDP EQ 11
   bp co .01 .02 n 4 p 2 
   setbb SUFIX 'f015'
    w %fn1%.%SUFIX%
    envelope
    w %fn1%.%SUFIX%.evlp   

  elseif $BANDP EQ 12
   bp co .008 .018 n 4 p 2 
   setbb SUFIX 'f013'
    w %fn1%.%SUFIX%
    envelope
    w %fn1%.%SUFIX%.evlp   

  elseif $BANDP EQ 13
   bp co .0065 .0165 n 4 p 2 
   setbb SUFIX 'f012'
    w %fn1%.%SUFIX%
    envelope
    w %fn1%.%SUFIX%.evlp   

  elseif $BANDP EQ 14
   bp co .005 .015 n 4 p 2 
   setbb SUFIX 'f010'
    w %fn1%.%SUFIX%
    envelope
    w %fn1%.%SUFIX%.evlp   

   elseif $BANDP EQ 15
   bp co .004 .014 n 4 p 2 
   setbb SUFIX 'f009'
    w %fn1%.%SUFIX%
    envelope
    w %fn1%.%SUFIX%.evlp   
    
    elseif $BANDP EQ 16
    bp co .003 .013 n 4 p 2 
    setbb SUFIX 'f008'
    w %fn1%.%SUFIX%
    envelope
    w %fn1%.%SUFIX%.evlp   
    
    elseif $BANDP EQ 17
    bp co .002 .012 n 4 p 2 
    setbb SUFIX 'f007'
    w %fn1%.%SUFIX%
    envelope
    w %fn1%.%SUFIX%.evlp   
    
    elseif $BANDP EQ 18
    bp co .001 .011 n 4 p 2 
    setbb SUFIX 'f006'
    w %fn1%.%SUFIX%
    envelope
    w %fn1%.%SUFIX%.evlp  
  endif
 enddo
   sc rm %fn2

elseif %npts GT 5000
 evaluate to cutb %cutb - 1000



else
 message "failed"
enif
enddo  
 
