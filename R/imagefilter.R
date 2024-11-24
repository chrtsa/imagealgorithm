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
