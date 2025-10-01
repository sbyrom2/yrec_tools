#!/bin/bash

#this distributes yrec models into the starting directories sequentially
# so that one doesn't have all the m60s etc
#good for use with zuulrunner


myHOME=/home/spitzer/tayar
rundir=$myHOME/EVOLUTION/output/YRECgrid/nodiff

#subout=testparams
#rundir=$myHOME/EVOLUTION/output/CZdiffRot
#rundir=$myHOME/EVOLUTION/output/M2_5w
#rundir=$myHOME/EVOLUTION/output/ZRmod
subin=nodiff_in00
#subout=newstarts2
#subout=nodiff_out2
subout=nodiff_in
#subin=CZd_in
#subout=CZd_out
#subin=M2_5in2
#subout=M2_5out50
#subin=ZR_in
#subout=ZR_out
cd $rundir/$subin

i=1

for file in *yrec8.nml1
do
#     echo $file
     nname=`echo $file | sed 's/nml1/nml2/'` 
#     nname2=`echo $file | sed 's/yrec8.nml1/.terminal/'`
     cp $file $rundir/$subout$i/$file
     cp $nname $rundir/$subout$i/$nname
     ((i++))
#     echo $i
     if [ $i -eq 41 ]
       then 
         i=1
#         echo $i
#         echo 'inside'
     fi
#     echo $i
#     cp $file $rundir/$subout/$file
#     cp $nname $rundir/$subout/$nname
#     cd $myHOME/EVOLUTION/code/source2013_test
#     ionice -c 2
#     echo $file>>$HOME/EVOLUTION/output/times.txt
#     mytime="$( TIMEFORMAT='%lR'; time (./model4.50t) 2>>$rundir/$subout/$nname2  1>>$rundir/$subout/$nname2)" 
#     condor_submit condor_run_submitfile_test
#     sleep 10
#     cd $rundir/$subin

done
cd $myHOME/EVOLUTION/output
 #    cd $HOME/EVOLUTION/output/idl
 #    idl
     
