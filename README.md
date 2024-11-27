
# imagealgorithm

<!-- badges: start -->
<!-- badges: end -->

Imagealgorithm is an R package that provides a function to apply filters to an image. The package includes predefined filters to convert the colors of each pixel to grey, red, green, or blue.

## Features
- Convert an image's colors to grayscale, red, green, or blue using prebuilt filters.
- Predefined filters include:
  - `bw`: Black-and-white filter.
  - `blue`: Blue color filter.
  - `green`: Green color filter.
  - `red`: Red color filter.
  - `grey`: Grayscale filter.

### Installation

Install the package directly from GitHub using `devtools`:

```R
# Install devtools if not already installed
install.packages("devtools")

# Install imagealgorithm
devtools::install_github("chrtsa/imagealgorithm")
```

## Example
A basic example that shows how to apply the grayscale filter to an image:

```R
library(imagealgorithm)

# Example: Apply the grayscale filter to an image
image_path <- "path/to/image.jpg"
result <- image_filter(image_path, grey)

# Save or display the resulting image
magick::image_write(result, "output.jpg")
```
