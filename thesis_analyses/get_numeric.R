get_numeric <- function(data_frame) {
  nums <- sapply(data_frame, is.numeric)
  print(data_frame[,nums])
  return(data_frame[,nums])
}