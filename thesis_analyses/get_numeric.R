get_numeric <- function(data_frame) {
  nums <- sapply(data_frame, is.numeric)
  return(data_frame[ , nums])
}