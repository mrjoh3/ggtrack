
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggtrack

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of project is to …

## Installation

You can install the latest version of project from
[Github](https://github.com) with:

``` r
devtools::install_github("mrjoh3/ggtrack")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ggtrack)
library(ggplot2)


gg <- ggplot(mapping = aes(x = 1:10, y = rnorm(10))) +
  geom_bar(stat = 'identity') +
  theme_minimal()

ggtrack(gg,
        qr_content = 'text content here',
        logo = 'https://www.r-project.org/logo/Rlogo.png')
```

<img src="man/figures/README-example-1.png" width="100%" />
