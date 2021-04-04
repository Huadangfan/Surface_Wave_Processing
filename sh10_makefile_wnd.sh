#!/bin/bash
# +---------------------------------------------------------+
# | make the wnd file($1: wnd fortran file. $2:output file) |
# +---------------------------------------------------------+

function makeWnd(){
    gfortran -g $1 -o $2 -L/usr/local/sac/lib/ -lsacio
}

# for rayleigh
for wndfile in `ls wnd_rayleigh_*_*.f`;do
    output=`echo $wndfile | awk -F'.' '{print $1}'`
    echo $output
    makeWnd $wndfile $output
done

# For love
for wndfile in `ls wnd_love_*_*.f`;do
    output=`echo $wndfile | awk -F'.' '{print $1}'`
    echo $output
    makeWnd $wndfile $output
done
