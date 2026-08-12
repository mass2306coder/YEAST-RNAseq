# Day 12 — RNA-seq Count Matrix QC

## Objective

The objective of Day 12 was to perform an initial quality assessment of the
gene-level RNA-seq count matrix generated using featureCounts.

## Count Matrix

The paired-end featureCounts matrix contained 7,036 yeast genes and two RNA-seq
samples:

- SRR8556612
- SRR8556616

## Library Size

| Sample | Assigned counts |
|--------|----------------:|
| SRR8556612 | 13,519,869 |
| SRR8556616 | 12,943,309 |

The two samples had comparable library sizes, indicating similar sequencing
depth at the gene-count level.

## Visualization

A bar plot was generated using R and ggplot2 to compare the total assigned
counts between the two samples.

Output:

`results/05_deseq2/library_sizes.png`

## Interpretation

The difference in assigned counts between the two samples was relatively small.
Therefore, there is no obvious extreme library-size imbalance between these
samples.

However, library size alone does not determine biological similarity.
Additional analyses such as count distributions and sample correlation will be
required.

## Important Limitation

Only two samples are currently available. Before performing differential
expression analysis with DESeq2, the biological condition associated with each
sample and the availability of biological replicates must be verified.

Therefore, this stage is considered count-matrix quality assessment rather than
formal differential-expression analysis.

## Sample Correlation

Pearson correlation was calculated using log2-transformed gene counts.

The two samples showed a strong positive correlation:

**Pearson r = 0.947**

The scatter plot demonstrated a clear positive relationship between gene-level
expression values in SRR8556612 and SRR8556616.

This indicates substantial concordance between the two expression profiles.

### Interpretation

The strong correlation suggests that the overall gene-expression profiles of
the two samples are similar.

However, correlation alone does not establish biological reproducibility.
The biological relationship between the samples must be verified from the
experimental metadata before drawing biological conclusions.

Output:

`results/05_deseq2/sample_correlation.png`
