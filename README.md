---
output: github_document
---

# Purpose

This is a demo package for UW BIOST 561 (Spring 2024), taught by Kevin Lin.

- The URL to the GitHub (i.e., the source code) is: https://github.com/amywatt/UWBiostat561
- The URL to the Pkgdown webpage is: https://amywatt.github.io/UWBiostat561

# How to install
This package is called `UWBiostat561`. To install, run the following code (in R):

```R
library(devtools)
devtools::install_github("amywatt/UWBiostat561")
```

Upon completion, you can run the following code (in R):
```R
library(UWBiostat561)
```

# Dependencies

The package depends on the following packages: `ggplot2`.

# Session info

This package was developed in the following environment

```R
─ Session info ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 setting  value
 version  R version 4.3.2 (2023-10-31)
 os       macOS Ventura 13.4
 system   aarch64, darwin20
 ui       RStudio
 language (EN)
 collate  en_US.UTF-8
 ctype    en_US.UTF-8
 tz       America/Los_Angeles
 date     2024-06-04
 rstudio  2023.12.0+369 Ocean Storm (desktop)
 pandoc   3.2 @ /usr/local/bin/ (via rmarkdown)

─ Packages ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 package      * version    date (UTC) lib source
 brio           1.1.5      2024-04-24 [1] CRAN (R 4.3.1)
 cachem         1.0.8      2023-05-01 [1] CRAN (R 4.3.0)
 callr          3.7.6      2024-03-25 [1] CRAN (R 4.3.1)
 cli            3.6.2      2023-12-11 [1] CRAN (R 4.3.1)
 colorspace     2.1-0      2023-01-23 [1] CRAN (R 4.3.0)
 crayon         1.5.2      2022-09-29 [1] CRAN (R 4.3.0)
 desc           1.4.3      2023-12-10 [1] CRAN (R 4.3.1)
 devtools       2.4.5      2022-10-11 [1] CRAN (R 4.3.0)
 digest         0.6.35     2024-03-11 [1] CRAN (R 4.3.1)
 dplyr          1.1.4      2023-11-17 [1] CRAN (R 4.3.1)
 ellipsis       0.3.2      2021-04-29 [1] CRAN (R 4.3.0)
 evaluate       0.23       2023-11-01 [1] CRAN (R 4.3.1)
 fansi          1.0.6      2023-12-08 [1] CRAN (R 4.3.1)
 farver         2.1.1      2022-07-06 [1] CRAN (R 4.3.0)
 fastmap        1.1.1      2023-02-24 [1] CRAN (R 4.3.0)
 fs             1.6.4      2024-04-25 [1] CRAN (R 4.3.1)
 generics       0.1.3      2022-07-05 [1] CRAN (R 4.3.0)
 ggplot2      * 3.5.1      2024-04-23 [1] CRAN (R 4.3.1)
 glue           1.7.0      2024-01-09 [1] CRAN (R 4.3.1)
 gtable         0.3.5      2024-04-22 [1] CRAN (R 4.3.1)
 htmltools      0.5.8.1    2024-04-04 [1] CRAN (R 4.3.1)
 htmlwidgets    1.6.4      2023-12-06 [1] CRAN (R 4.3.1)
 httpuv         1.6.15     2024-03-26 [1] CRAN (R 4.3.1)
 igraph         2.0.3      2024-03-13 [1] CRAN (R 4.3.1)
 knitr          1.45       2023-10-30 [1] CRAN (R 4.3.1)
 labeling       0.4.3      2023-08-29 [1] CRAN (R 4.3.0)
 later          1.3.2      2023-12-06 [1] CRAN (R 4.3.1)
 lifecycle      1.0.4      2023-11-07 [1] CRAN (R 4.3.1)
 magrittr       2.0.3      2022-03-30 [1] CRAN (R 4.3.0)
 memoise        2.0.1      2021-11-26 [1] CRAN (R 4.3.0)
 mime           0.12       2021-09-28 [1] CRAN (R 4.3.0)
 miniUI         0.1.1.1    2018-05-18 [1] CRAN (R 4.3.0)
 munsell        0.5.1      2024-04-01 [1] CRAN (R 4.3.1)
 pillar         1.9.0      2023-03-22 [1] CRAN (R 4.3.0)
 pkgbuild       1.4.4      2024-03-17 [1] CRAN (R 4.3.1)
 pkgconfig      2.0.3      2019-09-22 [1] CRAN (R 4.3.0)
 pkgdown        2.0.9      2024-04-18 [1] CRAN (R 4.3.1)
 pkgload        1.3.4      2024-01-16 [1] CRAN (R 4.3.1)
 processx       3.8.4      2024-03-16 [1] CRAN (R 4.3.1)
 profvis        0.3.8      2023-05-02 [1] CRAN (R 4.3.0)
 promises       1.3.0      2024-04-05 [1] CRAN (R 4.3.1)
 ps             1.7.6      2024-01-18 [1] CRAN (R 4.3.1)
 purrr          1.0.2      2023-08-10 [1] CRAN (R 4.3.0)
 R6             2.5.1      2021-08-19 [1] CRAN (R 4.3.0)
 Rcpp           1.0.12     2024-01-09 [1] CRAN (R 4.3.1)
 remotes        2.5.0      2024-03-17 [1] CRAN (R 4.3.1)
 rlang          1.1.3      2024-01-10 [1] CRAN (R 4.3.1)
 rmarkdown      2.26       2024-03-05 [1] CRAN (R 4.3.1)
 rprojroot      2.0.4      2023-11-05 [1] CRAN (R 4.3.1)
 rstudioapi     0.16.0     2024-03-24 [1] CRAN (R 4.3.1)
 scales         1.3.0      2023-11-28 [1] CRAN (R 4.3.1)
 sessioninfo    1.2.2      2021-12-06 [1] CRAN (R 4.3.0)
 shiny          1.8.1.1    2024-04-02 [1] CRAN (R 4.3.1)
 stringi        1.8.3      2023-12-11 [1] CRAN (R 4.3.1)
 stringr        1.5.1      2023-11-14 [1] CRAN (R 4.3.1)
 testthat       3.2.1.1    2024-04-14 [1] CRAN (R 4.3.1)
 tibble         3.2.1      2023-03-20 [1] CRAN (R 4.3.0)
 tidyselect     1.2.1      2024-03-11 [1] CRAN (R 4.3.1)
 urlchecker     1.0.1      2021-11-30 [1] CRAN (R 4.3.0)
 usethis        2.2.3      2024-02-19 [1] CRAN (R 4.3.1)
 utf8           1.2.4      2023-10-22 [1] CRAN (R 4.3.1)
 UWBiostat561 * 0.0.0.9000 2024-06-04 [1] local
 vctrs          0.6.5      2023-12-01 [1] CRAN (R 4.3.1)
 withr          3.0.0      2024-01-16 [1] CRAN (R 4.3.1)
 xfun           0.43       2024-03-25 [1] CRAN (R 4.3.1)
 xtable         1.8-4      2019-04-21 [1] CRAN (R 4.3.0)
 yaml           2.3.8      2023-12-11 [1] CRAN (R 4.3.1)
```
