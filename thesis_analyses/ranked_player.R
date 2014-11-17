ranked_player <- function(demographics) {
  demographics$plays_ranked = F
  plays_3v3 <- ifelse(is.na(demographics$plays_3v3),F,T)
  plays_5v5 <- ifelse(is.na(demographics$plays_5v5),F,T)
  plays_non_team <- ifelse(is.na(demographics$plays_non_team),F,T)
  return demographics
}