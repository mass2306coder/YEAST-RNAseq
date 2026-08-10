#!/bin/bash

mkdir -p results/04_counts

featureCounts \
-T 4 \
-p \
-t exon \
-g gene_id \
-a reference/Saccharomyces_cerevisiae.R64-1-1.63.gtf \
-o results/04_counts/gene_counts.txt \
results/03_alignment/bam/SRR8556612.sorted.bam \
results/03_alignment/bam/SRR8556616.sorted.bam

echo "featureCounts completed."
