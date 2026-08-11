# Day 7 – Gene Count Matrix Preparation and QC

## Objective

To prepare a gene-level count matrix from the paired-end RNA-seq featureCounts output and perform basic quality checks before differential expression analysis.

## Input

The paired-end featureCounts output generated during Day 6:

`results/04_counts/gene_counts_paired.txt`

The count table was generated from:

- SRR8556612
- SRR8556616

The reads were counted as paired-end fragments using `--countReadPairs`.

## Count Matrix Preparation

The featureCounts output contains several annotation columns:

- Geneid
- Chr
- Start
- End
- Strand
- Length

For downstream DESeq2 analysis, only the gene identifier and sample count columns are required.

The following command was used to generate the count matrix:

```bash
awk 'BEGIN{FS=OFS="\t"}
/^#/ {next}
$1=="Geneid" {
    print "GeneID","SRR8556612","SRR8556616"
    next
}
{
    gsub(/^gene:/,"",$1)
    print $1,$7,$8
}' results/04_counts/gene_counts_paired.txt \
> results/05_deseq2/count_matrix.tsv
o

