#!/bin/csh


set srcdir=$1
set dstdir=$2
set sacfil=$3

if ( $srcdir == "" ) then 
   set srcdir=`pwd`
endif
if ($dstdir == "") then
    set dstdir=$srcdir
endif
if ( ! -d $srcdir || ! -d $dstdir ) then
   echo "USAGE: $0 [source directory] [dest directory]"
   exit 0
endif

set self=$0
set self=$self:t

split -l 500 $sacfil

#set filelist=`ls $srcdir`
set filelist=`ls $srcdir | grep '^[0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}[^a-zA-Z].*$'`
echo "Begin"

foreach filelist (`ls x*`)
{
foreach file (`cat $filelist`) 
   if ( -f $srcdir/$file && $file != $self ) then
      set dir=`echo $file | awk -F'.' '{printf"%s",$1"."$2"."$3}'`  
      set dir=$dstdir/$dir
      if ( -d $dir ) then
         echo "moving $srcdir/$file to $dir ..."
         mv -f $srcdir/$file $dir
      else
         mkdir $dir
         echo "moving $srcdir/$file to $dir ..."
         mv -f $srcdir/$file $dir
      endif
   else
    :
   endif
end
}&
end
wait
echo "Done"
rm x*
