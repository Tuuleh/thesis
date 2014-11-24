impute_median <- function(data_frame) {
  for(name in names(data_frame)) {
    data_frame[,name] <- ifelse(is.na(data_frame[,name]), median(data_frame[,name], na.rm = T), data_frame[,name]) 
  }
  return(data_frame)
}