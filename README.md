# Skin microbiome and atopic dermatitis in babies

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7660269.svg)](https://doi.org/10.5281/zenodo.7660269)

© Copyright 2022 Alexis Rapin

**Authors:** Alexis Rapin (https://orcid.org/0000-0003-3448-5459), Matthew Macowan (https://orcid.org/0000-0001-7721-1349), Eva Maria Rehbinder (https://orcid.org/0000-0002-1796-0433)

## Description

This R project is an archive of the code used in the data analysis associated with the study entitled ["The skin microbiome in the first year of life and its association with atopic dermatitis" (Rapin, Rehbinder, et al. 2023, Allergy, doi:10.1111/all.15671)](https://doi.org/10.1111/all.15671) [1]. It does not contain any input nor output data used in the analysis.

The study assesses the association between the skin microbiome and AD, skin barrier integrity and allergic diseases in the first year of life. It further explores the evolution of the skin microbiome with age and its possible determinants, including delivery mode.

A table of Amplicon Sequence Variants (ASVs) was derived from raw bacterial 16S rRNA gene amplicons sequences using the [DADA2 pipeline](https://benjjneb.github.io/dada2) (R dada2 package version 1.18.0) and SILVA database (version 123) as described [here](https://github.com/chuvpne/dada2-pipeline).

All further data processing and analysis was done within the R notebooks located in the ``notebooks/`` directory.

The computation was performed within the [Service for Sensitive Data (TSD)](https://www.uio.no/english/services/it/research/sensitive-data/) at the University of Oslo.

## Resources

- Raw bacterial 16S rRNA gene amplicons sequences used in this project are available on the European Nucleotide Archive database under accession number [PRJEB42268](https://www.ebi.ac.uk/ena/browser/view/PRJEB42268).
- PreventADALL clinical trial NCT record: https://clinicaltrials.gov/ct2/show/NCT02449850.

## Get this project

You can clone this project from https://github.com:

```
$ git clone https://github.com/alexisrapin/skin-microbiome-and-atopic-dermatitis-in-babies.git
```

## Requirements

- R version 3.5.2
- R packages dependencies: Boruta, caret, colorRamps, cowplot, data.table, epitools, factoextra, FactoMineR, fpc, ggplotify, ggpubr, ggrepel, gridExtra, gtools, here, Hmisc, infotheo, missForest, pheatmap, plyr, randomcoloR, randomForest, RColorBrewer, reshape2, ROCR, scales, spls, svglite, tidyverse, vegan, VennDiagram
- Data
  - Investigation variables and subjects metadata: These data are not publicly available and are stored exclusively at the Service for Sensitive Data at University of Oslo in accordance with the Norwegian legislation on personal data protection.
  - Raw bacterial 16S rRNA gene amplicons sequences derived from skin swabs: Publicly available on the European Nucleotide Archive database under accession number PRJEB42268.

## Structure

<pre>
.
├── etc            Configuration files and metadata description
├── figs           Figures (not included in archive)
├── data           Data (not included in archive)
├── lib            Project R library
└── notebooks      R notebooks
</pre>

## References

1. Rapin, A., Rehbinder, E.M., Macowan, M., Pattaroni, C., Carlsen, K.C.L., Harris, N.L., Jonassen, C.M., Landrø, L., Lossius, A.H., Nordlund, B., Rudi, K., Skjerven, H.O., Staff, A.C., Söderhäll, C., Ubags, N., Vettukattil, R. and Marsland, B.J. (2023), The skin microbiome in the first year of life and its association with atopic dermatitis. Allergy. Accepted Author Manuscript. https://doi.org/10.1111/all.15671
