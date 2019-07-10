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

plot_volcano(so, test = "conditionuntreated", test_type = "wt", which_model = "full",
             sig_level = 0.1, point_alpha = 0.2, sig_color = "orange")

dev.off()
