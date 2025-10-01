#!/bin/bash
myHOME=/home/jtayar
rundir=$myHOME/Desktop/RunDir/YREC/YREC20250903JT
yrec="/home/jtayar/Desktop/RunDir/YREC/YREC20250903JT/yrec/src/yrec"

subin=public_in
subout=public_out #testsuite #
cd $rundir/$subin

for file in *.nml1
do
     echo $file
     nname=`echo $file | sed 's/nml1/nml2/'` 
     nname2=`echo $file | sed 's/.nml1/.terminal/'`
     cp $file $rundir/$subout/$file
     cp $nname $rundir/$subout/$nname
     mytime="$( TIMEFORMAT='%lR'; time ("$yrec" "$file" "$nname") 2>>$rundir/$subout/$nname2  1>>$rundir/$subout/$nname2)" 
#     sleep 10
     cd $rundir/$subin

done
cd $rundir 
     
