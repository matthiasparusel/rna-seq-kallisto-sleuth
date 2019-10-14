suppressMessages({
  library("sleuth")
})

model <- snakemake@params[["model"]]
sl <- snakemake@params[['sig_level']]
pa <- snakemake@params[['point_alpha']]

pdf(file = snakemake@output[[1]])

so <- sleuth_load(snakemake@input[[1]])
so <- sleuth_fit(so, as.formula(model[["full"]]), 'full')
so <- sleuth_fit(so, as.formula(model[["reduced"]]), 'reduced')

so <- sleuth_wt(so, "conditionuntreated")

plot_vars(so, test = NULL, test_type = "wt", which_model = "full",
  sig_level = sl, point_alpha = pa, sig_color = "red", xy_line = TRUE,
  xy_line_color = "red", highlight = NULL, highlight_color = "green")

dev.off()
