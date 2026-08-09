# Alignment Interpretation

## HISAT2 Alignment

The trimmed paired-end RNA-seq reads were aligned to the
Saccharomyces cerevisiae R64-1-1 reference genome using HISAT2.

| Sample | Condition | Concordant 1× | Concordant >1× | Overall alignment |
|--------|-----------|---------------|-----------------|-------------------|
| SRR8556612 | WT | 85.20% | 9.33% | 95.90% |
| SRR8556616 | mcd1-1 | 84.12% | 9.32% | 95.18% |

Both samples showed high overall alignment rates (>95%).
The proportion of uniquely concordantly aligned reads was also high,
with 85.20% for SRR8556612 and 84.12% for SRR8556616.

The alignment rates were highly similar between the WT and mcd1-1
samples, indicating comparable mapping quality between the two samples.

The multiple-mapping fraction was approximately 9.3% in both samples.
No major difference in alignment performance was observed between
the two conditions.

## BAM QC with samtools flagstat

Sorted BAM files were evaluated using samtools flagstat.

| Sample | Primary mapped | Properly paired | Singletons |
|--------|----------------|-----------------|------------|
| SRR8556612 | 95.90% | 94.52% | 1.10% |
| SRR8556616 | 95.18% | 93.45% | 1.47% |

Both samples showed high primary mapping rates (>95%) and high
proper-pairing rates (>93%). Singleton reads were low in both samples.
No supplementary alignments were detected.

The results indicate good and comparable alignment performance
between the two samples.

Note: samtools flagstat reports zero duplicates because duplicate
marking was not performed. Therefore, the duplication estimates from
the fastp/FastQC analysis should be used when discussing read
duplication.


## SAM to BAM Conversion and Sorting

HISAT2 generated SAM files containing the alignment information. Since SAM files are large and text-based, they were converted into compressed, binary BAM format using SAMtools.

The SAM files were coordinate-sorted to prepare them for downstream analysis.

### SRR8556612

```bash
samtools sort \
  -@ 4 \
  -o results/03_alignment/bam/SRR8556612.sorted.bam \
  results/03_alignment/SRR8556612.sam

samtools sort \
  -@ 4 \
  -o results/03_alignment/bam/SRR8556616.sorted.bam \
  results/03_alignment/SRR8556616.sam

BAM Indexing

The coordinate-sorted BAM files were indexed using SAMtools. The index allows genomic regions to be accessed quickly without scanning the entire BAM file.

SRR8556612
samtools index results/03_alignment/bam/SRR8556612.sorted.bam

SRR8556616
samtools index results/03_alignment/bam/SRR8556616.sorted.bam


BAM Quality Assessment

Alignment statistics were examined using:

samtools flagstat results/03_alignment/bam/SRR8556612.sorted.bam

and

samtools flagstat results/03_alignment/bam/SRR8556616.sorted.bam
