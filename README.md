<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggtrack

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/mrjoh3/ggtrack/workflows/R-CMD-check/badge.svg)](https://github.com/mrjoh3/ggtrack/actions)
<!-- badges: end -->

<div style="float: right;">

<img src="man/figures/ggtrack-logo.svg" width="300px">

</div>

Sometimes in a workplace it is hard to know exactly where or when a
specific chart has been produced. This is especially true when someone
has copied a chart out of a report to use somewhere else. The `ggtrack`
package aims to solve this problem by embedding enough metadata in the
charts image to identify the source and the exact time it was produced.

The metadata is added by way of a QR code embedded in a chart “tracking”
footer. The QR code can encode any arbitrary text and will append a time
stamp. The text is intended to be a URL or a unique id for the original
document or chart source.

QR codes can then be scanned using a phone scanner or the [quadrangle
package](https://github.com/brianwdavis/quadrangle).

The `ggtrack` footer can also display a corporate logo and additional
text.

## Installation

You can install the latest version of project from
[Github](https://github.com) with:

``` r
devtools::install_github("mrjoh3/ggtrack")
```

On a linux system you may also need to install the png and jpeg libs.

``` console
sudo apt install libpng-dev libjpeg-dev
```

## Development

This package is in the early stages of development. If you have any
suggestions, or feature requests please submit an
[issue](https://github.com/mrjoh3/ggtrack/issues). All feedback is
welcome.

## A Minimum Example

To start you just need a `ggplot` and some text you wish to encode into
the QR. The QR is intended to contain enough information to uniquely
identify the report, so a URL, file name or other unique identifier. The
QR encode process automatically appends a time stamp. But try to keep
the content of the QR code minimal. The for information it is the more
pixels its requires and the larger it needs to be. The examples here
need a QR code size of 1.8cm to be reliably scanned using a phone off
the screen. QR code are encoded using the
[qrencoder](https://github.com/hrbrmstr/qrencoder) package.

``` r
library(ggtrack)
#> Warning: replacing previous import 'ggplot2::last_plot' by 'plotly::last_plot'
#> when loading 'ggtrack'
library(ggplot2)
library(grid)

gg <- ggplot(mapping = aes(x = 1:10, y = rnorm(10))) +
  geom_bar(stat = 'identity') +
  theme_minimal()

ggtrack(gg,
        qr_content = 'Report ID: 2c9075a5-4d7e-47a5-8616-55dd88af3dc5')
```

<img src="man/figures/README-example-1.png" width="80%" style="display: block; margin: auto;" />
