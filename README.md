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