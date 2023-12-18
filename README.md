# PROJECT 4: Implement a bioinformatic workflow to call copy number variants reconstruct cell phylogenies from single-cell sequencing data

To run the code:

## Step 1: build bam index
'''samtools index -b bam_file.bam'''

## Step 2: 
nextflow run script_nf.nf --bams "bam_file.bam" --outdir "result"