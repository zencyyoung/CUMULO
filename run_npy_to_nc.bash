#!/usr/bin/env bash
load="cumulo-dataset/2008"
save="cumulo-dataset-nc/2008" 

for root in $(find $load -mindepth 1 -maxdepth 1 -type d)
do
   for type in "daylight" "night" "corrupt"
   do
        loadp="${root}/${type}/MYD021KM*.npy" ;
        ls $loadp | xargs --max-procs=1 -n 1 python -W ignore netcdf/npy_to_nc.py $save;
   done
done
