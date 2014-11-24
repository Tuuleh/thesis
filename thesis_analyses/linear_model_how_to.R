fit <- lm(ranked_team$relative_non_team ~ ranked_team$fl_mean_rt + ranked_team$mr_rel_diff_rt + tol_mean_rt, data=ranked_team)
> 
  > summary(fit)