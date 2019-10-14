suppressMessages({
  library("sleuth")
})

so <- sleuth_load(snakemake@input[[1]])
pdf(file = snakemake@output[[1]])

plot_mean_var(so, which_model = "full", point_alpha = 0.4,
  point_size = 2, point_colors = c("black", "dodgerblue"),
  smooth_alpha = 1, smooth_size = 0.75, smooth_color = "red")

dev.off()
