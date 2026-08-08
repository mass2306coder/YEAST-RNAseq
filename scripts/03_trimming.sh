#!/bin/bash

mkdir -p data/processed/trimmed

fastp \
-i data/raw/SRR8556612_1.fastq \
-I data/raw/SRR8556612_2.fastq \
-o data/processed/trimmed/SRR8556612_1.trimmed.fastq \
-O data/processed/trimmed/SRR8556612_2.trimmed.fastq \
--detect_adapter_for_pe \
-h results/01_fastqc/SRR8556612_fastp.html \
-j results/01_fastqc/SRR8556612_fastp.json

fastp \
-i data/raw/SRR8556616_1.fastq \
-I data/raw/SRR8556616_2.fastq \
-o data/processed/trimmed/SRR8556616_1.trimmed.fastq \
-O data/processed/trimmed/SRR8556616_2.trimmed.fastq \
--detect_adapter_for_pe \
-h results/01_fastqc/SRR8556616_fastp.html \
-j results/01_fastqc/SRR8556616_fastp.json

# Post-trimming quality control
fastqc \
data/processed/trimmed/SRR8556612_1.trimmed.fastq \
data/processed/trimmed/SRR8556612_2.trimmed.fastq \
data/processed/trimmed/SRR8556616_1.trimmed.fastq \
data/processed/trimmed/SRR8556616_2.trimmed.fastq \
-o results/01_fastqc

multiqc \
results/01_fastqc \
-o results/02_multiqc_trimmed