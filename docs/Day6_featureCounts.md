# Day 6 – Read Quantification with featureCounts

## Objective

To quantify the number of RNA-seq reads assigned to annotated genes using
featureCounts.

## Input

Sorted and indexed BAM files:

- SRR8556612.sorted.bam
- SRR8556616.sorted.bam

Reference annotation:

- Saccharomyces_cerevisiae.R64-1-1.63.gtf

## Annotation preparation

The original Ensembl GFF3 annotation was converted to GTF format using
gffread because featureCounts requires a suitable gene identifier attribute.

## featureCounts command

```bash
featureCounts \
-T 4 \
-p \
-t exon \
-g gene_id \
-a reference/Saccharomyces_cerevisiae.R64-1-1.63.gtf \
-o results/04_counts/gene_counts.txt \
results/03_alignment/bam/SRR8556612.sorted.bam \
results/03_alignment/bam/SRR8556616.sorted.bam
