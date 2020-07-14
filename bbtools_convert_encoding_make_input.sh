#! /bin/bash

# Convert all fastq's in a directory to Illumina 1.9 encoding (Phred+33) 
# Use bbtools' reformat.sh
# gzip fasta files 

set -e

old_Fastqs=(../Fastq_64/*fastq.gz)
qin=64
new_Fastq_dir=../Fastq
qout=33
logdir=./Logs/bbtools_convert_encoding
INPUTS=./Inputs
input_file=${INPUTS}/bbtools_convert_encoding.inputs

mkdir -p ${new_Fastq_dir}
mkdir -p ${logdir}

rm -rf ${input_file}

echo "$(date):  Writing input file for bbtools_convert_encoding_run_parallel.pbs for ${#old_Fastqs[@]} fastq files from ${qin} to ${qout} encoding"

for fastq in "${old_Fastqs[@]}"; do
	basename=$(basename "$fastq" | cut -d. -f1)
	new_fastq=${new_Fastq_dir}/${basename}.fastq.gz
	echo "$fastq,$qin,$new_fastq,$qout,$logdir" >> ${input_file}
done

