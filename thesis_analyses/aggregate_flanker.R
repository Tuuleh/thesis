# a script to aggregate proportion of correct and average response time
# for congruent and incongruent flanker tasks
aggregate_flanker <- function(flanker_uids, flanker_results) {
  
  for (uid in flanker_uids) {
      congruent_trials <- subset(
      flanker,
      flanker$user_id == uid & flanker$type == "congruent", 
      select = c(user_id, rt, correct)) 
      # on the next line, change mean(congruent_trials$rt to subset of trials that are correct)
      correct_congruent_trials <- subset(congruent_trials, congruent_trials$correct == 1, select = rt)
      flanker_results[uid,]$congruent_mean <- mean(correct_congruent_trials$rt)
      flanker_results[uid,]$congruent_sd <- sd(correct_congruent_trials$rt)
    
      congruent_correct <- sum(congruent_trials$correct)/length(congruent_trials$correct)
      flanker_results[uid,]$congruent_correct <- congruent_correct
    
    incongruent_trials <- subset(
      flanker,
      flanker$user_id == uid & flanker$type == "incongruent",
      select = c(user_id, rt, correct))

      correct_incongruent_trials <- subset(incongruent_trials, incongruent_trials$correct == 1, select = rt)
      flanker_results[uid,]$incongruent_mean <- mean(correct_incongruent_trials$rt)
      flanker_results[uid,]$incongruent_sd <- sd(correct_incongruent_trials$rt)
    
      incongruent_correct <- sum(incongruent_trials$correct)/length(incongruent_trials$correct)
      flanker_results[uid,]$incongruent_correct <- incongruent_correct
  }
  return(flanker_results)
}