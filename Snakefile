include: "rules/common.smk"
include: "rules/trim.smk"
include: "rules/quant.smk"
include: "rules/diffexp.smk"

rule all:
    input:
        expand(
            [
                "tables/diffexp/{model}.diffexp.tsv",
                "plots/diffexp-heatmap/{model}.diffexp-heatmap.pdf",
                "tables/tpm-matrix/{model}.tpm-matrix.tsv"
            ],
            model=config["diffexp"]["models"]
        ),
        expand("plots/pca/{covariate}.pca.pdf", covariate=samples.columns[samples.columns != "sample"]),
        [get_bootstrap_plots(model) for model in config["diffexp"]["models"]],
        [get_bootstrap_plots(model, config["bootstrap_plots"]["genes_of_interest"])
            for model in config["diffexp"]["models"] ],
        expand("plots/fld/{unit.sample}-{unit.unit}.fragment-length-dist.pdf", unit=units[["sample", "unit"]].itertuples())
