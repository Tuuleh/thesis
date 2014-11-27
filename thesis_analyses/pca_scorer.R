#This is not going to work - correct proportions will have a much lower weight because they're in fractions,
#whereas response times are in thousands (milliseconds)
#you have to use PCA$weights as a multiplier, not loadings!
#pca_scorer(cog_PCA$loadings, construct_components$user_id, construct_components, cog_PCA$weights)

#parsimonious_PCA <- principal(construct_components[21:length(construct_components)], nfactors = 4, rotate = "varimax", scores = T, impute='median')


# writes PCA scores manually from only scores with high enough loadings
pca_scorer <- function(loadings, uids, merged, weights) {
  #instantiate the columns that will contain the components
  for (col in colnames(loadings)) {
    merged[,col] <- NA
  }
  weights <- as.data.frame(weights)
  exclude <- c('max_length','tol_mean_rt','mr_rt_120','mr_correct_180','mr_rel_diff_rt')
  #loop through every user_id...
  for (uid in uids) {
    #loop through all the components
    for (component in colnames(loadings)) {
      #loop through all the variables and check their loadings
      col_loading <- NA
      for (score in rownames(loadings)) {
        #if score is on the list of the scores I want to exclude
        if (is.element(score, exclude)) {
          next
        }
        if ((loadings[score,component] < -0.36) | (loadings[score,component] > 0.36)) {
          print(merged[uid,score])
          if(!is.na(merged[uid,score])) {
            col_loading =+ weights[score,component] * merged[uid,score]
          }
          else {
            #if loading is missing for the particular predictor, replace it with median
            col_loading =+ weights[score,component] * median(merged[,score], na.rm=T)
          }
        }  
      }
      merged[uid,component] <- col_loading
      print(cat(uid, component, col_loading, merged[uid,component]))
    }
  }
  return(merged)
  
}