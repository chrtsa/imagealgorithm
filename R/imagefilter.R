#'@title Greyscale transformation
#'@description This function takes an RGB vector and applies a greyscale transformation
#'@param rgb_vector A numeric vector of length 3 representing the RGB values of a pixel.
#'@return A numeric value representing the grey value of the pixel.
#'@export
grey <- function(rgb_vector){
  R <- as.integer(rgb_vector[1])
  G <- as.integer(rgb_vector[2])
  B <- as.integer(rgb_vector[3])
  grey <- round(R * 0.299 + G * 0.587 + B * 0.114)
  return(grey)
}
#' @title Black and white filter
#' @description This function applies a black and white filter to an RGB pixel based on a grey cutoff value.
#' @param rgb_vector A numeric vector of length 3 representing the RGB values of a pixel.
#' @param cut_off Numeric value, the threshold to determine if the pixel should be black or white (default is 127).
#' @return A numeric value .
#' @export
bw <- function(rgb_vector, cut_off = 127){
  grey <- as.integer(grey(rgb_vector))
  if(grey < cut_off){
    return(c(0, 0, 0))
  } else {
    return(c(255, 255, 255))
  }
}
#'@title Red filter
#'@description This function applies a red filter to an RGB pixel based on a grey cutoff value.
#' @param rgb_vector A numeric vector of length 3 representing the RGB values of a pixel.
#' @param cut_off Numeric value, the threshold to determine if the pixel should be red (default is 127).
#' @return A numeric vector of length 3, either c(255, 0, 0) for red or c(0, 0, 0) for black.
#' @export
red <- function(rgb_vector, cut_off = 127)
#' @title Green filter
#' @description This function applies a green filter to an RGB pixel based on a grey cutoff value.
#' @param rgb_vector A numeric vector of length 3 representing the RGB values of a pixel.
#' @param cut_off Numeric value, the threshold to determine if the pixel should be green (default is 127).
#' @return A numeric vector of length 3, either c(0, 128, 0) for green or c(0, 0, 0) for black.
#' @export
green <- function(rgb_vector, cut_off = 127) {
  grey <- as.integer(grey(rgb_vector))
  if (grey < cut_off) {
    return(c(0, 128, 0))
  } else {
    return(c(0, 0, 0))
  }
}
#' @title Blue filter
#' @description This function applies a blue filter to an RGB pixel based on a grey cutoff value.
#' @param rgb_vector A numeric vector of length 3 representing the RGB values of a pixel.
#' @param cut_off Numeric value, the threshold to determine if the pixel should be blue (default is 127).
#' @return A numeric vector of length 3, either c(0, 0, 255) for blue or c(0, 0, 0) for black.
#' @export
blue <- function(rgb_vector,cut_off = 127) {
  grey <- as.integer(grey(rgb_vector))
  if (grey < cut_off) {
    return(c(0, 0, 255))
  } else {
    return(c(0, 0, 0))
  }
}
#' @title Apply a filter to the image
#' @description This function takes an image and applies the selected filter to each pixel.
#' The filter is applied by passing each pixel through the provided function.
#'
#' @param image A file path to an image that will be processed.
#' @param filter A function that processes each RGB pixel of the image.
#'
#' @return An image object with the filter applied.
#' @details The function uses the magick::image_read() function to read and process the image
#'Ensure the package is installed and loaded
#' @export
image_filter <- function(image, filter) {
  # Read the image
  obj <- image_read(image)

  # Convert the image to a bitmap (3D array)
  bitmap <- as.integer(obj[[1]])  # Convert to 3D array of RGB values
  dims <- dim(bitmap)  # Get the dimensions (rows, columns, channels)

  # Loop through each pixel in the bitmap
  for (i in 1:dims[1]) {  # Loop through the rows
    for (j in 1:dims[2]) {  # Loop through the columns
      # Extract RGB values of pixels
      pixel <- bitmap[i, j, ]

      # Apply the filter to the pixel
      filtered_pixel <- filter(pixel)

      # Assign the filtered pixel back to the bitmap
      bitmap[i, j, ] <- filtered_pixel
    }
  }

  # Normalise the values back to [0, 255]
  bitmap <- pmax(pmin(bitmap, 255), 0)

  # Convert the bitmap to RGB values and create an RGB matrix
  rgb_matrix <- apply(bitmap, c(1, 2), function(pixel) {
    rgb(pixel[1], pixel[2], pixel[3], maxColorValue = 255)
  })

  img <- image_read(as.raster(rgb_matrix))

  return(img)
}
