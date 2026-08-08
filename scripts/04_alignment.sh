#!/bin/bash

# HISAT2 alignment for GSE126364
# Saccharomyces cerevisiae R64-1-1

set -e

PROJECT=~/yeast_RNAseq
INDEX=$PROJECT/reference/hisat2_index/yeast_R64-1-1
OUT=$PROJECT/results/03_alignment
THREADS=4

mkdir -p "$OUT"

echo "Starting HISAT2 alignment..."

# SRR8556612 - WT replicate 1
hisat2 \
    -p $THREADS \
    -x "$INDEX" \
    -1 "$PROJECT/data/processed/trimmed/SRR8556612_1.trimmed.fastq" \
    -2 "$PROJECT/data/processed/trimmed/SRR8556612_2.trimmed.fastq" \
    -S "$OUT/SRR8556612.sam"

# SRR8556616 - mcd1-1 replicate 1
hisat2 \
    -p $THREADS \
    -x "$INDEX" \
    -1 "$PROJECT/data/processed/trimmed/SRR8556616_1.trimmed.fastq" \
    -2 "$PROJECT/data/processed/trimmed/SRR8556616_2.trimmed.fastq" \
    -S "$OUT/SRR8556616.sam"

echo "HISAT2 alignment completed."
