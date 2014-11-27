extreme_p <- function(p_column) {
  p_column <- ifelse(p_column < 0.6, NA, p_column)
  return(p_column)
}