max_team <- function(demographics) {
  demographics$team_rating <- demographics$relative_5v5
  for (uid in demographics$user_id) {
    if(!is.na(demographics[uid,]$relative_3v3)) {
      three_v3 <- demographics[uid,]$relative_3v3
      if(is.na(demographics[uid,]$team_rating) || three_v3 > demographics[uid,]$team_rating) {
        demographics[uid,]$team_rating <- three_v3
      }
    }
  }
  return(demographics)
}