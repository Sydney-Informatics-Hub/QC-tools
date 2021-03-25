# QC-tools

The scripts in this repository contain scripts that can be used to quality check raw sequencing files. The scripts have been specifically optimised to run efficiently and at scale on the __National Compute Infrastructure, Gadi.__

# FastQC

The following scripts produce quality reports from FASTQC for a list of `fastq.gz` files. Each FASTQ file is a task and tasks can be processed in parallel.

1. Create the inputs for the tasks:

       sh fastqc_make_input /path/to/dir
      
2. Adjust <project>, compute resources and your version of fastqc in `fastqc_run_parallel.pbs`
3. Run the script:

       qsub fastqc_run_parallel.pbs

# Cite us to support us!

If you use our pipelines, please cite us:

Sydney Informatics Hub, Core Research Facilities, University of Sydney, 2021, *The Sydney Informatics Hub Bioinformatics Repository*, \<date accessed\>, <https://github.com/Sydney-Informatics-Hub/Bioinformatics>


# Acknowledgements

Acknowledgements (and co-authorship, where appropriate) are an important way for us to demonstrate the value we bring to your research. Your research outcomes are vital for ongoing funding of the Sydney Informatics Hub and national compute facilities. 

Suggested acknowledgements:

__NCI Gadi__

The authors acknowledge the technical assistance provided by the Sydney Informatics Hub, a Core Research Facility of the University of Sydney. This research/project was undertaken with the assistance of resources and services from the National Computational Infrastructure (NCI), which is supported by the Australian Government.

# References

FastQC https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
