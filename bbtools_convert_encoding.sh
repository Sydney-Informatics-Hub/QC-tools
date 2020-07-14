#!/bin/bash

module load bbtools/37.98

in=`echo $1 | cut -d ',' -f 1`
qin=`echo $1 | cut -d ',' -f 2`
out=`echo $1 | cut -d ',' -f 3`
qout=`echo $1 | cut -d ',' -f 4`
logdir=`echo $1 | cut -d ',' -f 5`

basename=$(basename "$in" | cut -d. -f1)
logfile=${logdir}/$basename.oe

echo "$(date): Running bbtools reformat.sh for in: ${in}, qin: $qin, out: $out, qout: $qout, logfile: $logfile" > ${logfile} 2>&1

reformat.sh in=${in} qin=${qin} out=${out} qout=${qout} >> ${logfile} 2>&1
