gene_names <- c("BRCA1", "TP53", "EGFR", "MYC", "PTEN", "KRAS")

control <- c(5.2, 7.8, 3.1, 9.4, 6.0, 4.5)

treated <- c(8.9, 7.6, 6.7, 12.1, 2.3, 9.8)

chromosome <- c("17", "17", "7", "8", "10", "12")

fold_change <- treated / control

classification <- ifelse(
  fold_change > 1.2,
  "upregulated",
  ifelse(fold_change < 0.8, "downregulated", "stable")
)

classification <- factor(
  classification,
  levels = c("upregulated", "downregulated", "stable")
)


gene_info <- list(
  names = gene_names,
  stats = list(
    control = control,
    treated = treated
  ),
  source = "Gene expression data from control and treated conditions"
)
gene_info$names

  
gene_info$date_analyzed <- Sys.Date()
gene_info
gene_df <- data.frame(
  gene_names,
  control,
  treated,
  chromosome,
  fold_change,
  classification
)
gene_df
gene_df$log2_fc <- log2(gene_df$fold_change)
gene_df


gene_chr17 <- subset(gene_df, chromosome == "17")
gene_chr17

gene_df_sorted <- gene_df[order(gene_df$fold_change, decreasing = TRUE), ]
gene_df_sorted

write.csv(
  gene_df_sorted,
  file = "gene_df_sorted.csv",
  row.names = FALSE
)
list.files()


plot_colors <- ifelse(
  gene_df$classification == "upregulated",
  "red",
  ifelse(
    gene_df$classification == "downregulated",
    "blue",
    "gray"
  )
)
png(
  "expression_plot.png",
  width = 800,
  height = 600
)

plot(
  gene_df$control,
  gene_df$treated,
  xlab = "Control Expression",
  ylab = "Treated Expression",
  main = "Gene Expression: Control vs Treated",
  col = plot_colors,
  pch = 19
)

dev.off()
list.files()
