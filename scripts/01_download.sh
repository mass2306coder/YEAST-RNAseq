#!/bin/bash

# GSE126364 RNA-seq dataset
# Download selected SRA runs using SRA Toolkit

set -e

mkdir -p data/raw

echo "Downloading SRR8556612..."
prefetch SRR8556612 --output-directory data/raw

echo "Downloading SRR8556616..."
prefetch SRR8556616 --output-directory data/raw

echo "Converting SRA files to paired-end FASTQ..."

fasterq-dump \
data/raw/SRR8556612/SRR8556612.sra \
--split-files \
--outdir data/raw

fasterq-dump \
data/raw/SRR8556616/SRR8556616.sra \
--split-files \
--outdir data/raw

echo "Download and FASTQ conversion completed."