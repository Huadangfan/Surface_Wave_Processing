#!/bin/csh
foreach file (`ls -d 1997 1998 1999 2000 2001 2002 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018`)
echo $file
cd $file 
mv * ../
cd ..
end

