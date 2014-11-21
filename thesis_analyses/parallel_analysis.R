library(nFactors)
parallel_analysis <- function(mydata) {
  ev <- eigen(cor(mydata)) # get eigenvalues
  ap <- parallel(subject=nrow(mydata),var=ncol(mydata),
                 rep=100,cent=.05)
  nS <- nScree(x=ev$values, aparallel=ap$eigen$qevpea)
  return(plotnScree(nS))  
}
