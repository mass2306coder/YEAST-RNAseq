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
## Results

| Sample | Total alignments | Assigned | Assignment rate |
|---|---:|---:|---:|
| SRR8556612 | 41,025,114 | 26,506,417 | 64.6% |
| SRR8556616 | 39,966,471 | 25,276,952 | 63.2% |

## Interpretation

Approximately 64.6% of alignments from SRR8556612 and 63.2% from
SRR8556616 were successfully assigned to annotated genes.

A substantial fraction of reads was not assigned because of
multimapping, unmapped reads, reads overlapping no annotated feature,
or ambiguous assignment.

The relatively high multimapping fraction should be considered when
interpreting the final gene-level count matrix.

## Output

The count matrix was generated as:

results/04_counts/gene_counts.txt

The featureCounts summary was generated as:

results/04_counts/gene_counts.txt.summary
