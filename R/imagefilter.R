#'@title Image filter
#'@param bitmap A 3D array representing an image
#'@return A 3D array representing the filtered image


filter_grey <- function(rgb_vector){
  R <- as.integer(rgb_vector[1])
  G <- as.integer(rgb_vector[2])
  B <- as.integer(rgb_vector[3])
  grey <- round(R * 0.299 + G * 0.587 + B * 0.114)
  return(grey)
}

filter_bw <- function(rgb_vector, cut_off = 127){
  grey <- as.integer(filter_grey(rgb_vector))
  if(grey < cut_off){
    return(c(0, 0, 0))
  } else {
    return(c(255, 255, 255))
  }
}

filter_red <- function(rgb_vector, cut_off = 127) {
  grey <- as.integer(filter_grey(rgb_vector))
  if (grey < cut_off) {
    return(c(255, 0, 0))
  } else {
    return(c(0, 0, 0))
  }
}

filter_green <- function(rgb_vector, cut_off = 127) {
  grey <- as.integer(filter_grey(rgb_vector))
  if (grey < cut_off) {
    return(c(0, 128, 0))
  } else {
    return(c(0, 0, 0))
  }
}

filter_blue <- function(rgb_vector,cut_off = 127) {
  grey <- as.integer(filter_grey(rgb_vector))
  if (grey < cut_off) {
    return(c(0, 0, 255))
  } else {
    return(c(0, 0, 0))
  }
}


filter_bitmap <- function(bitmap, filter, ...){
  raw_bitmap <- as.integer(bitmap) #I will first convert the bitmap to make it easier to work with.
  dims <- dim(raw_bitmap)
  #Making sure the input is appropriate
  if(length(dims) != 3) {
    stop("The input bitmap must be a 3D array")
  }

  if(dims[3] != 3){
    stop("The input bitmap must have 3 channels")
  }

  # loop over rows and columns
  for (i in 1:dims[1]){
    for (j in 1:dims[2]){
      bitmap[i, j, ] <- filter(bitmap[i, j, ])
    }
  }
  #normalising values to 0-255
  bitmap <- pmax(pmin(bitmap, 255), 0)
  rgb_matrix <- apply(bitmap, c(1, 2), function(pixel) {
    rgb(pixel[1], pixel[2], pixel[3], maxColorValue = 255)
  })
  img <- image_read(as.raster(rgb_matrix))
  return(img)
}
