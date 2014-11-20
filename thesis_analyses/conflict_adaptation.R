#a script for building conflict adaptation results for Flanker
conflict_adaptation <- function(flanker, flanker_uids, flanker_results) {
  flanker_results$ca_rt <- NA
  flanker_results$ca_correct <- NA
  for (uid in flanker_uids) {
    relevant_trials <- subset(flanker, flanker$user_id == uid) 
    
    boolean_trial_type <- ifelse(relevant_trials$type == 'congruent', T,F)
    inc_check <- c(F,1-(boolean_trial_type[1:length(boolean_trial_type)-1]))
    #vector that has value 2 if conflict adaptation happens
    relevant_trials$ca <- boolean_trial_type + inc_check
    relevant_trials$ca <- ifelse(relevant_trials$ca == 2, T, F)    
    ca_trials <- subset(relevant_trials, relevant_trials$ca == T)

    flanker_results[uid,]$ca_rt <- mean(ca_trials$rt)
    flanker_results[uid,]$ca_correct <- mean(ca_trials$correct)
  }
  return(flanker_results)
}
