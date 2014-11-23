region_swap <- function(dataframe_region) {
  ifelse(dataframe_region=='na',1,
         ifelse(dataframe_region=='euw',3,ifelse(
           dataframe_region=='eune',4,ifelse(
             dataframe_region=='lan',2,ifelse(
               dataframe_region=='nz',5,ifelse(
                 dataframe_region =='br', 2, ifelse(
                   dataframe_region =='las', 2, dataframe_region)))))))
}