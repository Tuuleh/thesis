aggregate_tol <- function(tol, tol_uids, tol_results) {
  tol_results$mean_rt <- NA
  tol_results$correct <- NA
  tol_results$max_correct <- NA
  tol_results$mean_missed <- NA
  for (uid in tol_uids) {
    relevant_trials <- subset(tol, tol$user_id == uid)
    correct_trials <- subset(relevant_trials, relevant_trials$missed_by == 0)
    tol_results[uid,]$mean_rt <- mean(correct_trials$rt)
    tol_results[uid,]$correct <- length(correct_trials$moves)/length(relevant_trials$moves)
    tol_results[uid,]$max_correct <- max(correct_trials$moves)
    tol_results[uid,]$mean_missed <- mean(relevant_trials$missed_by)
  }
  return(tol_results)
}