#!/bin/bash

fastqc \
data/raw/SRR8556612_1.fastq \
data/raw/SRR8556612_2.fastq \
data/raw/SRR8556616_1.fastq \
data/raw/SRR8556616_2.fastq \
-o results/01_fastqc

multiqc \
results/01_fastqc \
-o results/02_multiqc