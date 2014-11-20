content_check <- function(test_uid_uids, mr_results, tol_results, merged_results) {
  for (uid in test_uid_uids) {
    print(merged_results[uid,]$mr_rotated_rt == mr_results[uid,]$mr_rotated_rt)
    print(merged_results[uid,]$mr_unrotated_rt == mr_results[uid,]$mr_unrotated_rt)
    print(merged_results[uid,]$tol_correct == tol_results[uid,]$tol_correct)
    print(merged_results[uid,]$tol_missed == tol_results[uid,]$tol_missed)
    print(merged_results[uid,]$max_correct == spatial_span[uid,]$max_correct)
    print(merged_results[uid,]$fl_executive_func == flanker_results[uid,]$fl_executive_func)
    print(merged_results[uid,]$fl_execut_rt == flanker_results[uid,]$fl_ca_rt)
  }
}