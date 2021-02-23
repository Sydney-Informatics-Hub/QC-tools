#! /bin/bash

#########################################################
#
# Platform: NCI Gadi HPC
# Description: 
# 	Creates input file for fastqc_run_parallel.pbs
# 	Inputs will be created for all fastq.gz files in ../Fastq
# Usage: 
#	Run from QC-tools directory:
# 	sh fastqc_make_input.sh
# Resource requirements:
# 	48 RNASeq fastq file=walltime=00:10:00,ncpus=48,mem=192GB,wd
# 	Multiply walltime or number of CPUs according to fastq number/size
# 	fastQC efficiency ~0.9 - 1
# Author: Tracy Chew
# tracy.chew@sydney.edu.au
# Date last modified: 23/02/2021
#
# If you use this script towards a publication, please acknowledge the
# Sydney Informatics Hub (or co-authorship, where appropriate).
#
# Suggested acknowledgement:
# The authors acknowledge the scientific and technical assistance
# <or e.g. bioinformatics assistance of <PERSON>> of Sydney Informatics
# Hub and resources and services from the National Computational
# Infrastructure (NCI), which is supported by the Australian Government
# with access facilitated by the University of Sydney.
#
#########################################################

Fastq=../Fastq
outdir=../FastQC_test
logdir=../Logs/FastQC_test
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

num_tasks=`wc -l ${input_file} | cut -d' ' -f 1`
echo "$(date): Number of FASTQ files (tasks): $num_tasks"
