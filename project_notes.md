\# GSE126364 RNA-seq Project Notes



\## Day 3 — Quality Control



\### FastQC and MultiQC



FastQC and MultiQC were performed on the paired-end RNA-seq reads.



\### Per Base Sequence Content



The WT samples showed somewhat greater nucleotide composition bias compared

with the mcd1-1 samples. Since RNA-seq libraries are derived from expressed

transcripts rather than random genomic DNA, some sequence composition bias is

expected.



This finding alone was not considered sufficient reason to discard the samples.



\### Sequence Duplication Levels



Elevated sequence duplication was observed, particularly in the WT samples.

Only approximately 21–39% of sequences were unique in the libraries examined.



Because this is a poly(A) RNA-seq experiment, elevated duplication may reflect

highly abundant transcripts and does not necessarily indicate PCR artifacts.

Therefore, duplicate reads were not removed at this stage.



\### Overrepresented Sequences



Less than 1% of reads were represented by overrepresented sequences in all

four samples examined. Therefore, no major overrepresented-sequence

contamination was observed.



\### Adapter Content



Adapter contamination increased substantially toward the 3' end of the reads,

with some sample/read combinations reaching approximately 28–40%.



Therefore, adapter trimming was considered necessary before downstream

alignment.



\### Decision



Adapter trimming will be performed using fastp with paired-end adapter

detection. The original FASTQ files will be retained, and the trimmed reads

will be subjected to FastQC/MultiQC again to verify the effectiveness of

trimming.

## Day 7 – Gene Count Matrix Preparation and QC

- Prepared a gene-level count matrix from paired-end featureCounts output.
- Used `gene_counts_paired.txt` generated with `--countReadPairs`.
- Generated `results/05_deseq2/count_matrix.tsv`.
- Count matrix contains 7,036 genes and two samples: SRR8556612 and SRR8556616.
- Total assigned counts:
  - SRR8556612: 13,519,869
  - SRR8556616: 12,943,309
- Genes detected:
  - SRR8556612: 6,634 (94.29%)
  - SRR8556616: 6,778 (96.33%)
- Genes with zero counts in both samples: 236.
- Examined highly expressed genes.
- DESeq2 analysis was not performed because experimental conditions and biological replicate information still need to be verified.
