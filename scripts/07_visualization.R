# Day 12 - Sample Correlation

library(ggplot2)

# Read count matrix
counts <- read.table(
  "results/05_deseq2/count_matrix.tsv",
  header = TRUE,
  row.names = 1,
  sep = "\t",
  check.names = FALSE
)

# Remove genes with zero counts in both samples
counts <- counts[rowSums(counts) > 0, ]

# Log transform
log_counts <- log2(counts + 1)

# Calculate Pearson correlation
correlation <- cor(
  log_counts$SRR8556612,
  log_counts$SRR8556616,
  method = "pearson"
)

cat(
  "Pearson correlation between samples:",
  round(correlation, 4),
  "\n"
)

# Create scatter plot
plot_data <- data.frame(
  SRR8556612 = log_counts$SRR8556612,
  SRR8556616 = log_counts$SRR8556616
)

p <- ggplot(
  plot_data,
  aes(x = SRR8556612, y = SRR8556616)
) +
  geom_point(alpha = 0.35, size = 1) +
  labs(
    title = paste(
      "RNA-seq Sample Correlation (r =",
      round(correlation, 3),
      ")"
    ),
    x = "SRR8556612 log2(count + 1)",
    y = "SRR8556616 log2(count + 1)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5)
  )

ggsave(
  "results/05_deseq2/sample_correlation.png",
  p,
  width = 9,
  height = 7,
  dpi = 300
)

cat("Correlation plot generated successfully.\n")
