% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/imagefilter.R
\name{bw}
\alias{bw}
\title{Black and white filter}
\usage{
bw(rgb_vector, cut_off = 127)
}
\arguments{
\item{rgb_vector}{A numeric vector of length 3 representing the RGB values of a pixel.}

\item{cut_off}{Numeric value, the threshold to determine if the pixel should be black or white (default is 127).}
}
\value{
A numeric value .
}
\description{
This function applies a black and white filter to an RGB pixel based on a grey cutoff value.
}
