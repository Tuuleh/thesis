#reverse scoring function for GEQ (scale of 9 points)
reverse <- function(item) {
  item <- 10-item
  return(item)
}