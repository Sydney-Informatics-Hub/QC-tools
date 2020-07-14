#! /bin/bash

# Create input file for fastqc_run_parallel.pbs

Fastq=../Fastq
outdir=../fastQC
logdir=./Logs/fastQC
INPUTS=./Inputs
input_file=${INPUTS}/fastqc.inputs
NCPUS=1

mkdir -p ${INPUTS}
mkdir -p ${logdir}
mkdir -p ${outdir}

rm -rf ${input_file}

for fastq in ${Fastq}/*fastq.gz; do
	basename=$(basename "$fastq" | cut -d. -f1)
	out=${outdir}/${basename}
	logfile=${logdir}/${basename}.oe
	
	mkdir -p ${out}
	echo "${fastq},${out},${logfile},${NCPUS}" >> ${input_file}
done
