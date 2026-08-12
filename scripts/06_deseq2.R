# ============================================================
# Day 12 - RNA-seq Count Matrix Exploration
# Dataset: GSE126364
# Organism: Saccharomyces cerevisiae
# ============================================================

# Load libraries
library(ggplot2)

# ------------------------------------------------------------
# 1. Read count matrix
# ------------------------------------------------------------

counts <- read.table(
  "results/05_deseq2/count_matrix_filtered.tsv",
  header = TRUE,
  sep = "\t",
  row.names = 1,
  check.names = FALSE
)

# Remove annotation columns if present
counts <- counts[, c("SRR8556612", "SRR8556616")]

# ------------------------------------------------------------
# 2. Inspect matrix
# ------------------------------------------------------------

cat("Number of genes:", nrow(counts), "\n")
cat("Number of samples:", ncol(counts), "\n")

cat("\nLibrary sizes:\n")
print(colSums(counts))

# ------------------------------------------------------------
# 3. Create library-size table
# ------------------------------------------------------------

library_sizes <- data.frame(
  Sample = colnames(counts),
  Reads = colSums(counts)
)

print(library_sizes)

# ------------------------------------------------------------
# 4. Plot library sizes
# ------------------------------------------------------------

p <- ggplot(library_sizes, aes(x = Sample, y = Reads)) +
  geom_col() +
  labs(
    title = "RNA-seq Library Sizes",
    x = "Sample",
    y = "Assigned Read Counts"
  ) +
  theme_minimal()

# Save plot
ggsave(
  "results/05_deseq2/library_sizes.png",
  plot = p,
  width = 7,
  height = 5,
  dpi = 300
)

cat("\nLibrary-size plot saved to:\n")
cat("results/05_deseq2/library_sizes.png\n")

# ------------------------------------------------------------
# End of Day 12 analysis
# ------------------------------------------------------------
