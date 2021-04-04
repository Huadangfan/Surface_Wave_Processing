#!/bin/bash

rm tmp_BH1_2_3.txt

for file in `ls -d [1,2]*[0,1,2,3,4,5,6,7,8,9]`;do
    cd $file
    num=`ls *BH[1,2,3]*SAC | wc -l`
    echo $file\ $num
    if [ $num -ne 0 ];then
        for norotate in `ls *BH1*SAC`;do
            echo `pwd`/${norotate}
            echo `pwd`/${norotate} >> tmp_BH1_2_3.txt
sac <<EOF
r $norotate
ch CMPAZ 0 CMPINC 90
wh
q
EOF
            newname=`echo $norotate | sed 's/BH1/BHN/g'`
            mv $norotate $newname
        done

        for norotate in `ls *BH2*SAC`;do
            echo `pwd`/${norotate}
            echo `pwd`/${norotate} >> tmp_BH1_2_3.txt
sac <<EOF
r $norotate
ch CMPAZ 90 CMPINC 90
wh
q
EOF
            newname=`echo $norotate | sed 's/BH2/BHE/g'`
            mv $norotate $newname
        done

        for norotate in `ls *BH3*SAC`;do
sac <<EOF
r $norotate
ch CMPAZ 0 CMPINC 0
wh
q
EOF
            newname=`echo $norotate | sed 's/BH3/BHZ/g'`
            mv $norotate $newname
            echo `pwd`/${norotate}
            echo `pwd`/${norotate} >> tmp_BH1_2_3.txt
        done
    fi
    cd ..
done
