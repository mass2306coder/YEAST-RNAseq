## Post-trimming comparison

Both SRR8556612 and SRR8556616 retained more than 97% of reads after
adapter and quality filtering.

SRR8556612 showed a reduction in mean read length from 150 bp to 132 bp,
while SRR8556616 decreased to 138 bp. The shorter post-trimming length of
SRR8556612 is consistent with its shorter insert-size peak (114 bp compared
with 135 bp for SRR8556616).

Base quality improved after filtering in both samples, with Q30 values
increasing to 95.73% and 94.78%, respectively.

The trimmed reads will undergo a second round of FastQC and MultiQC to
verify removal of adapter contamination before alignment.