con <- function() {
  con <-dbConnect(MySQL(), user='tuuli',dbname ='thesis_results', host='localhost')
}