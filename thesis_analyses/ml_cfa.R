# Maximum Likelihood Factor Analysis entering raw data and extracting 3 factors, with varimax rotation 
# The rotation= options include "varimax", "promax", and "none". 
# Add the option scores="regression" or "Bartlett" to produce factor scores. 
# Use the covmat= option to enter a correlation or covariance matrix directly. 
# If entering a covariance matrix, include the option n.obs=.
ml_cfa <- function(mydata, factors, rotation) {
  fit <- factanal(mydata, factors, rotation=rotation)
  print(fit, digits=2, cutoff=.3, sort=TRUE)
  # plot factor 1 by factor 2 
  load <- fit$loadings[,1:2] 
  plot(load,type="n") # set up plot 
  text(load,labels=names(mydata),cex=.7) # add variable names
}
