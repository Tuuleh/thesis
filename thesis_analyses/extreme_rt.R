extreme_rt <- function(rt_column, cut_off) {
  rt_column <- ifelse(rt_column > cut_off, NA, rt_column)
  return(rt_column)
}