# A script for aggregating individual results from the mental rotation task 
# (after cleaning up obviously invalid trials )
aggregate_mr <- function(mr_uids, mr_results, rotated, unrotated) {
  mr_results <- data.frame(mr_uids)
  names(mr_results) <- ('user_id')
  rownames(mr_results) <- mr_results$user_id
  mr_results$mr_rotated_rt <- NA
  mr_results$mr_rotated_rt_sd <- NA
  mr_results$mr_rotated_correct <- NA
  mr_results$mr_unrotated_rt <- NA
  mr_results$mr_unrotated_rt_sd <- NA
  mr_results$mr_unrotated_correct <- NA
  mr_results$mr_rt_120 <- NA
  mr_results$mr_correct_180 <- NA
  mr_results$mr_abs_diff_rt <- NA
  mr_results$mr_rel_diff_rt <- NA
  print(mr_results)
  
  for (uid in mr_uids) {
    rotated_trials <-subset(rotated, rotated$user_id == uid)    
    unrotated_trials <- subset(unrotated, unrotated$user_id == uid)
    rotated_correct <- subset(rotated_trials, rotated_trials$correct == 1, select = "rt")
    unrotated_correct <- subset(unrotated_trials, unrotated_trials$correct == 1, select = "rt")
    
    mean_rotated_rt <- mean(rotated_correct$rt)
    mean_unrotated_rt <- mean(unrotated_correct$rt)
    
    mr_results[uid,]$mr_rotated_rt <- mean_rotated_rt
    mr_results[uid,]$mr_rotated_rt_sd <- sd(rotated_correct$rt)
    mr_results[uid,]$mr_rotated_correct <- mean(rotated_trials$correct)
    
    mr_results[uid,]$mr_unrotated_rt <- mean(unrotated_correct$rt)
    mr_results[uid,]$mr_unrotated_rt_sd <- sd(unrotated_correct$rt)
    mr_results[uid,]$mr_unrotated_correct <- mean(unrotated_trials$correct)
    
    mr_results[uid,]$mr_abs_diff_rt <- mean_rotated_rt - mean_unrotated_rt
    mr_results[uid,]$mr_rel_diff_rt <- mr_results[uid,]$mr_abs_diff_rt / mean_rotated_rt
    
    trials_180 <- subset(rotated_trials, rotation == 180)
    trials_120 <- subset(rotated_trials, rotation == 120)
    
    mr_results[uid,]$mr_rt_120 <- mean(trials_120$rt)
    mr_results[uid,]$mr_correct_180 <- mean(trials_180$correct)
  }
  return(mr_results)
}