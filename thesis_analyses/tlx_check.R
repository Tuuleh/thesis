tlx_check = function(inventories, participants, default) {
  for (row in length(participants)) {
    subscale_values <- integer(length(inventories))
    iterator <- 1
    for (inventory in inventories) {
      subscale_values[iterator] <- inventory
      iterator <- iterator+1
    }
    if (mean(subscale_values) == default && sd(subscale_values)==0) {
      print ("omg cheater")
    }
  }
}