include: "rules/common.smk"
include: "rules/trim.smk"
include: "rules/quant.smk"
include: "rules/diffexp.smk"

rule all:
    input:
        expand("plots/vars/{model}.vars.pdf", model=config["diffexp"]["models"]),
