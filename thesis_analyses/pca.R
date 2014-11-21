# Pricipal Components Analysis
# entering raw data and extracting PCs 
# from the correlation matrix 
pca <- function(mydata) {
  fit <- princomp(mydata, cor=TRUE)
  summary(fit) # print variance accounted for 
  loadings(fit) # pc loadings 
  plot(fit,type="lines") # scree plot 
  fit$scores # the principal components
  return(biplot(fit))
}
