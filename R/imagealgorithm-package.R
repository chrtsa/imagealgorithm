#'@keywords internal
#'@title Image filter
#'@description This package provides preselected tools to apply colour transformations to images.
#'It allows the application of a grey transformation, as well as blue, green, red and black and white
#'It requires the "magick" package to work
#'@details The function that should be used is image_filter(). It requires the path to the image and the name of the filter to be applied.
#'The accepted image types are the same as for image_read() from the magick package, i.e. .png and .jpg.
#'The available filters are grey, blue, green, red and bw.
#'@docType package
#'@import magick
#'@importFrom grDevices rgb as.raster
#'@name imagealgorithm
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end
NULL
