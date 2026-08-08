## Quality Control

Raw paired-end reads were assessed using FastQC and summarized with MultiQC.

QC identified:
- nucleotide composition bias in some libraries
- elevated sequence duplication
- low overrepresented-sequence content (<1%)
- substantial adapter contamination toward the 3' end

Because the data were generated using poly(A) RNA-seq, elevated sequence
duplication was interpreted cautiously and duplicate reads were not removed.

Adapter contamination was addressed using fastp, followed by post-trimming
quality assessment.